contract c13919{
  /**
   * @dev Cancel finish minting request, can be call only by owner
   * which created this finish minting request.
   */
  function cancelFinishMintingRequest () public {
    require (msg.sender == finishMintingStruct.initiator);
    require (!finishMintingStruct.isCanceled);
    finishMintingStruct.isCanceled = true;
    emit FinishMintingRequestCanceled();
  }
}