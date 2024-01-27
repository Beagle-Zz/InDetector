contract c10931{
  /**
   * Legacy API signature.
   */
  function buyWithCustomerId(uint128 customerId) public payable {
    investWithCustomerId(msg.sender, customerId);
  }
}