contract c16910{
  /*
  * @dev Reenabling after the freeze since was initiated.
  * @param _unfreezeNotice string Reason for the unfreeze or the explanation of solution.
  */
  function unfreezeTransfersSince(string _unfreezeNotice) onlyOwner public returns(bool success){
    tokenFrozenSinceBlock = (2 ** 256) - 1;
    tokenFrozenSinceNotice = _unfreezeNotice;
    emit TokenFrozenSince((2 ** 256) - 1, _unfreezeNotice);
    return true;
  }
}