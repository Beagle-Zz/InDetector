contract c13433{
  // NOTE: Doesn't use API key so that we don't have to do all the fancy encryption stuff.
  function _getQueryStr(uint256 min, uint256 max) internal returns(string) {
    return strConcat("https://www.random.org/integers/?num=1&min=", uint2str(min), "&max=", uint2str(max), "&col=1&base=10&format=plain&rnd=new");
  }
}