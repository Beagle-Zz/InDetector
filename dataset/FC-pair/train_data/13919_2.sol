contract c13919{
  /**
   * @dev Set new mint request, can be call only by owner
   * @param _spender address The address which you want to mint to
   * @param _value uint256 the amount of tokens to be minted
   */
  function setNewMintRequest (address _spender, uint _value) public onlyOwners canCreate {
    require (setNewMint.creationTimestamp + lifeTime < uint32(now) || setNewMint.isExecute || setNewMint.isCanceled);
    require (!mintingFinished);
    address[] memory addr;
    setNewMint = SetNewMint(_spender, _value, 1, false, msg.sender, false, uint32(now), addr);
    setNewMint.confirmators.push(msg.sender);
    emit NewMintRequestSetup(msg.sender, _spender, _value);
  }
}