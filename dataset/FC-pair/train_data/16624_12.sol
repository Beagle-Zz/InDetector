contract c16624{
  // Allow an Option's Buyer to exercise the Option, trading amountTraded of assetTraded to the Option for amountLocked of assetLocked.
  // The traded funds are sent directly to the Seller so they don't need to close it afterwards.
  // Transitions an Option from Live to Exercised, withdrawing its implicitly stored locked funds.
  function exerciseOption(address[3] assetLocked_assetTraded_firstMaker,
                          uint256[3] amountLocked_amountTraded_maturation) external {
    // Option must be Live, which means it's been filled and hasn't passed its trading deadline (Maturation).
    require(getOptionState(assetLocked_assetTraded_firstMaker, amountLocked_amountTraded_maturation) == optionStates.Live);
    bytes32 optionHash = getOptionHash(assetLocked_assetTraded_firstMaker, amountLocked_amountTraded_maturation);
    address buyer = optionData[optionHash].buyer;
    address seller = optionData[optionHash].seller;
    // Only allow the current Buyer to exercise the Option.
    require(msg.sender == buyer);
    // The Buyer sends the Seller the traded assets as specified by the Option parameters.
    transferUserToUser(buyer, seller, assetLocked_assetTraded_firstMaker[1], amountLocked_amountTraded_maturation[1]);
    // Mark the Option as Exercised by zeroing out the Buyer and the corresponding nonce.
    delete optionData[optionHash].buyer;
    delete optionData[optionHash].nonceBuyer;
    // The Buyer receives the implicitly stored locked assets as specified by the Option parameters.
    userBalance[buyer][assetLocked_assetTraded_firstMaker[0]] = userBalance[buyer][assetLocked_assetTraded_firstMaker[0]].add(amountLocked_amountTraded_maturation[0]);
    emit UserBalanceUpdated(buyer, assetLocked_assetTraded_firstMaker[0], userBalance[buyer][assetLocked_assetTraded_firstMaker[0]]);
    emit OptionExercised(optionHash, buyer, seller);
  }
}