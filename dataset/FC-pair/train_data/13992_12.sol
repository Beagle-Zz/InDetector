contract c13992{
  /* Check the remaining quantity of presale in this round. */
  function getRemainingPreSalesAmount() public view returns(uint256){
    return balances[PRESALE_ADDRESS];
  }
}