contract c18691{
  /**
   * Invest to tokens, recognize the payer.
   *
   */
  function buyWithCustomerIdWithChecksum(uint128 customerId, bytes1 checksum) public payable {
    // see customerid.py
    if (bytes1(sha3(customerId)) != checksum) throw;
    investWithCustomerId(msg.sender, customerId);
  }
}