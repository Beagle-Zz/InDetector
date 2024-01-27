contract c16624{
  // Allows a Taker to fill an offchain Option order created by a Maker.
  // Transitions new Options from Available to Live, depositing its implicitly stored locked funds.
  // Maintains state of existing Options as Live, without affecting their implicitly stored locked funds.
  function fillOptionOrder(address[3] assetLocked_assetTraded_firstMaker,
                           uint256[3] amountLocked_amountTraded_maturation,
                           uint256[2] amountPremium_expiration,
                           address assetPremium,
                           bool makerIsSeller,
                           uint96 nonce,
                           uint8 v,
                           bytes32[2] r_s) external {
    // Verify offchain order hasn't expired.
    require(now < amountPremium_expiration[1]);
    bytes32 optionHash = getOptionHash(assetLocked_assetTraded_firstMaker, amountLocked_amountTraded_maturation);
    // A hash of the Order's information which was signed by the Maker to create the offchain order.
    bytes32 orderHash = getOrderHash(optionHash, amountPremium_expiration, assetPremium, makerIsSeller, nonce);
    // A nonce of zero corresponds to creating a new Option, while nonzero means reselling an old one.
    if(nonce == 0) {
      // Option must be Available, which means it is valid, unfilled, and uncancelled.
      require(getOptionState(assetLocked_assetTraded_firstMaker, amountLocked_amountTraded_maturation) == optionStates.Available);
      // Option must not already be past its Maturation time.
      require(now < amountLocked_amountTraded_maturation[2]);
      // Verify the Maker's offchain order is valid by checking whether it was signed by the first Maker.
      require(ecrecover(orderHash, v, r_s[0], r_s[1]) == assetLocked_assetTraded_firstMaker[2]);
      // Set the Option's Buyer and Seller and initialize the nonces to 1, marking the Option as Live.
      // Ternary operator to assign the Seller and Buyer from the Maker and Taker: (<conditional> ? <if-true> : <if-false>)
      optionData[optionHash].seller = makerIsSeller ? assetLocked_assetTraded_firstMaker[2] : msg.sender;
      optionData[optionHash].nonceSeller = 1;
      optionData[optionHash].buyer = makerIsSeller ? msg.sender : assetLocked_assetTraded_firstMaker[2];
      optionData[optionHash].nonceBuyer = 1;
      // The Buyer pays the Seller the premium for the Option.
      payForOption(optionData[optionHash].buyer, optionData[optionHash].seller, assetPremium, amountPremium_expiration[0]);
      // Lock amountLocked of the Seller's assetLocked in implicit storage as specified by the Option parameters.
      require(userBalance[optionData[optionHash].seller][assetLocked_assetTraded_firstMaker[0]] >= amountLocked_amountTraded_maturation[0]);
      userBalance[optionData[optionHash].seller][assetLocked_assetTraded_firstMaker[0]] = userBalance[optionData[optionHash].seller][assetLocked_assetTraded_firstMaker[0]].sub(amountLocked_amountTraded_maturation[0]);
      emit UserBalanceUpdated(optionData[optionHash].seller, assetLocked_assetTraded_firstMaker[0], userBalance[optionData[optionHash].seller][assetLocked_assetTraded_firstMaker[0]]);
      emit OrderFilled(optionHash, 
                       assetLocked_assetTraded_firstMaker[2],
                       msg.sender,
                       assetLocked_assetTraded_firstMaker,
                       amountLocked_amountTraded_maturation,
                       amountPremium_expiration,
                       assetPremium,
                       makerIsSeller,
                       nonce);
    } else {
      // Option must be Live, which means this order is a resale by the current buyer or seller.
      require(getOptionState(assetLocked_assetTraded_firstMaker, amountLocked_amountTraded_maturation) == optionStates.Live);
      // If the Maker is the Seller, they're buying back out their locked asset.
      // Otherwise, the Maker is the Buyer and they're reselling their ability to exercise the Option.
      if(makerIsSeller) {
        // Verify the nonce of the Maker's offchain order matches to ensure the order isn't old or cancelled.
        require(optionData[optionHash].nonceSeller == nonce);
        // Verify the Maker's offchain order is valid by checking whether it was signed by the Maker.
        require(ecrecover(orderHash, v, r_s[0], r_s[1]) == optionData[optionHash].seller);
        // The Maker pays the Taker the premium for buying out their locked asset.
        payForOption(optionData[optionHash].seller, msg.sender, assetPremium, amountPremium_expiration[0]);
        // The Taker directly sends the Maker an amount equal to the Maker's locked assets, replacing them as the Seller.
        transferUserToUser(msg.sender, optionData[optionHash].seller, assetLocked_assetTraded_firstMaker[0], amountLocked_amountTraded_maturation[0]);
        // Update the Option's Seller to be the Taker and increment the nonce to prevent double-filling.
        optionData[optionHash].seller = msg.sender;
        optionData[optionHash].nonceSeller += 1;
        emit OrderFilled(optionHash, 
                         optionData[optionHash].seller,
                         msg.sender,
                         assetLocked_assetTraded_firstMaker,
                         amountLocked_amountTraded_maturation,
                         amountPremium_expiration,
                         assetPremium,
                         makerIsSeller,
                         nonce);
      } else {
        // Verify the nonce of the Maker's offchain order matches to ensure the order isn't old or cancelled.
        require(optionData[optionHash].nonceBuyer == nonce);
        // Verify the Maker's offchain order is valid by checking whether it was signed by the Maker.
        require(ecrecover(orderHash, v, r_s[0], r_s[1]) == optionData[optionHash].buyer);
        // The Taker pays the Maker the premium for the ability to exercise the Option.
        payForOption(msg.sender, optionData[optionHash].buyer, assetPremium, amountPremium_expiration[0]);
        // Update the Option's Buyer to be the Taker and increment the nonce to prevent double-filling.
        optionData[optionHash].buyer = msg.sender;
        optionData[optionHash].nonceBuyer += 1;
        emit OrderFilled(optionHash, 
                         optionData[optionHash].buyer,
                         msg.sender,
                         assetLocked_assetTraded_firstMaker,
                         amountLocked_amountTraded_maturation,
                         amountPremium_expiration,
                         assetPremium,
                         makerIsSeller,
                         nonce);
      }      
    }
  }
}