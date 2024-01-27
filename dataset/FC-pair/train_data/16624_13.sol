contract c16624{
  // Allows an Option's Seller to withdraw their funds after the Option's Maturation.
  // Transitions an Option from Matured to Closed, withdrawing its implicitly stored locked funds.
  function closeOption(address[3] assetLocked_assetTraded_firstMaker,
                       uint256[3] amountLocked_amountTraded_maturation) external {
    // Option must have Matured, which means it's filled, unexercised, and has passed its Maturation time.
    require(getOptionState(assetLocked_assetTraded_firstMaker, amountLocked_amountTraded_maturation) == optionStates.Matured);
    bytes32 optionHash = getOptionHash(assetLocked_assetTraded_firstMaker, amountLocked_amountTraded_maturation);
    address seller = optionData[optionHash].seller;
    // Only allow the Seller to close their own Option.
    require(msg.sender == seller);
    // Mark the Option as Closed by zeroing out the Seller and the corresponding nonce.
    delete optionData[optionHash].seller;
    delete optionData[optionHash].nonceSeller;
    // Transfer the Option's implicitly stored locked funds back to the Seller.
    userBalance[seller][assetLocked_assetTraded_firstMaker[0]] = userBalance[seller][assetLocked_assetTraded_firstMaker[0]].add(amountLocked_amountTraded_maturation[0]);
    emit UserBalanceUpdated(seller, assetLocked_assetTraded_firstMaker[0], userBalance[seller][assetLocked_assetTraded_firstMaker[0]]);
    emit OptionClosed(optionHash, seller);
  }
}