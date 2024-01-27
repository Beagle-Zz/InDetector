contract c13919{
  /**
   * @dev Approve finish minting request, can be call only by owner
   * which don't call this finish minting request before.
   */
  function ApproveFinishMintingRequest () public onlyOwners {
    require (!finishMintingStruct.isCanceled && !finishMintingStruct.isExecute);
    require (finishMintingStruct.creationTimestamp + lifeTime >= uint32(now));
    require (!mintingFinished);
    for (uint i = 0; i < finishMintingStruct.confirmators.length; i++){
      require(finishMintingStruct.confirmators[i] != msg.sender);
    }
    finishMintingStruct.confirmators.push(msg.sender);
    finishMintingStruct.confirms++;
    if(finishMintingStruct.confirms >= needApprovesToConfirm){
      token.finishMinting();
      finishMintingStruct.isExecute = true;
      mintingFinished = true;
    }
    emit FinishMintingRequestUpdate(msg.sender, finishMintingStruct.confirms, finishMintingStruct.isExecute);
  }
}