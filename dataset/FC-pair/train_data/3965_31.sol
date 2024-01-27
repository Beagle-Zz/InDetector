contract c3965{
// Override tokens amount as token has no decimal points and «_rate» not used
  function _getTokenAmount(uint256 _weiAmount)
    internal view returns (uint256) {
    return _weiAmount/(10**18);
  }
}