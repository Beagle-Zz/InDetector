contract c16910{
  /*
  * @dev Freezes transfers untill the specified block. Afterwards all of the operations are carried on as normal.
  * @param _frozenUntilBlock uint256 Number of block untill which all of the transfers are frozen.
  * @param _freezeNotice string Reason fot the freeze of operations.
  */
  function freezeTransfersUntil(uint256 _frozenUntilBlock, string _freezeNotice) onlyOwner public returns(bool success){
    tokenFrozenUntilBlock = _frozenUntilBlock;
    tokenFrozenUntilNotice = _freezeNotice;
    emit TokenFrozenUntil(_frozenUntilBlock, _freezeNotice);
    return true;
  }
}