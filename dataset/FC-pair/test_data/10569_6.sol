contract c10569{
  /*
   * unit test for crowdsale exchange rate
   */
  function testExchangeRate(uint blockNumber) public constant returns(uint256) {
    if (blockNumber <= fundingStartBlock+43200) return 10000; // early price
    if (blockNumber <= fundingStartBlock+2*43200) return 8000; // crowdsale price
    return 7000; // default price
  }
}