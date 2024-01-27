contract c10569{
  /*
   * unit test for calculate funded amount
   */
  function testFunded(uint256 amount) public constant returns(uint256) {
    uint256 tokens = mul(amount, exchangeRate());
    return add(funded, tokens);
  }
}