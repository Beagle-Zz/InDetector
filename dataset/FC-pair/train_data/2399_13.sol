contract c2399{
  //real
  //uint256 public constant MINIMUM_ETHER_SPEND = (250 * 10**(decimals-3));
  //uint256 public constant MAXIMUM_ETHER_SPEND = 300 * 10**decimals;
  modifier canMint() 
  {
    require(!mintingFinished);
    _;
  }
}