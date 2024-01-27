contract c13919{
  /**
   * @dev Approve mint request, can be call only by owner
   * which don't call this mint request before.
   */
  function approveNewMintRequest () public onlyOwners {
    require (!setNewMint.isExecute && !setNewMint.isCanceled);
    require (setNewMint.creationTimestamp + lifeTime >= uint32(now));
    require (!mintingFinished);
    for (uint i = 0; i < setNewMint.confirmators.length; i++){
      require(setNewMint.confirmators[i] != msg.sender);
    }
    setNewMint.confirms++;
    setNewMint.confirmators.push(msg.sender);
    if(setNewMint.confirms >= needApprovesToConfirm){
      setNewMint.isExecute = true;
      token.mint(setNewMint.spender, setNewMint.value); 
    }
    emit NewMintRequestUpdate(msg.sender, setNewMint.confirms, setNewMint.isExecute);
  }
}