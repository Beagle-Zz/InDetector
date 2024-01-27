contract c13919{
  /**
   * @dev Cancel mint request, can be call only by owner
   * which created this mint request.
   */
  function cancelMintRequest () public {
    require (msg.sender == setNewMint.initiator);    
    require (!setNewMint.isCanceled && !setNewMint.isExecute);
    setNewMint.isCanceled = true;
    emit NewMintRequestCanceled();
  }
}