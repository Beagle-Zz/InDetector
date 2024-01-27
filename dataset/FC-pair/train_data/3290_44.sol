contract c3290{
  // total wei raised in the presale and public sale
  function totalWei() public constant returns(uint256) {
    uint256 presaleWei = super.totalWei();
    return presaleWei.add(weiRaised);
  }
}