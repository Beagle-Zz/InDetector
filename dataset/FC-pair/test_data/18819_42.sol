contract c18819{
  /**
   * Investing function that recognizes the payer.
   * 
   * @param customerId UUIDv4 that identifies this contributor
   */
  function buyWithCustomerId(uint128 customerId) public payable {
    buyOnBehalfWithCustomerId(msg.sender, customerId);
  }
}