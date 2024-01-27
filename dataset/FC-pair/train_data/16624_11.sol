contract c16624{
  // Allows a Maker to cancel their offchain Option order early (i.e. before its expiration).
  function cancelOptionOrder(address[3] assetLocked_assetTraded_firstMaker,
                             uint256[3] amountLocked_amountTraded_maturation,
                             bool makerIsSeller) external {
    optionStates state = getOptionState(assetLocked_assetTraded_firstMaker, amountLocked_amountTraded_maturation);
    // Option must be Available or Live.  Orders can't be filled in any other state.
    require(state == optionStates.Available || state == optionStates.Live);
    bytes32 optionHash = getOptionHash(assetLocked_assetTraded_firstMaker, amountLocked_amountTraded_maturation);
    // If the Option is Available, the first order hasn't been filled yet.
    if(state == optionStates.Available) {
      // Only allow the Maker to cancel their own offchain Option order.
      require(msg.sender == assetLocked_assetTraded_firstMaker[2]);
      emit OrderCancelled(optionHash, makerIsSeller, 0);
      // Mark the Option as Cancelled by setting the Seller nonce nonzero while the Seller is still 0x0.
      optionData[optionHash].nonceSeller = 1;
    } else {
      // Live Options can be resold by either the Buyer or the Seller.
      if(makerIsSeller) {
        // Only allow the Maker to cancel their own offchain Option order.
        require(msg.sender == optionData[optionHash].seller);
        emit OrderCancelled(optionHash, makerIsSeller, optionData[optionHash].nonceSeller);
        // Invalidate the old offchain order by incrementing the Maker's nonce.
        optionData[optionHash].nonceSeller += 1;
      } else {
        // Only allow the Maker to cancel their own offchain Option order.
        require(msg.sender == optionData[optionHash].buyer);
        emit OrderCancelled(optionHash, makerIsSeller, optionData[optionHash].nonceBuyer);
        // Invalidate the old offchain order by incrementing the Maker's nonce.
        optionData[optionHash].nonceBuyer += 1;
      }
    }
  }
}