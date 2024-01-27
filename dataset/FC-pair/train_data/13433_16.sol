contract c13433{
  // NOTE: 1%, can be modified!
  function _computeRollFee(uint256 wagerAfterQuery) private pure returns (uint256) {
    return SafeMath.div(wagerAfterQuery, 100);
  }
}