contract c13433{
  // NOTE: Set to less than total balance so contract balance can't ever be drained
  function _getAvailableBalance() internal returns(uint256) {
    return address(this).balance;
  }
}