contract c18719{
  /**
   * Investing function that recognizes the payer and verifies he is allowed to invest.
   *
   * @param customerId UUIDv4 that identifies this contributor
   */
  function buyWithSignedAddress(uint128 customerId, uint8 v, bytes32 r, bytes32 s) public payable {
    buyOnBehalfWithSignedAddress(msg.sender, customerId, v, r, s);
  }
}