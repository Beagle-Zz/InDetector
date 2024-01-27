contract c18677{
  /**
   * Invest to tokens, recognize the payer and clear his address.
   *
   */
  function buyWithSignedAddress(uint128 customerId, uint8 v, bytes32 r, bytes32 s) public payable {
    investWithSignedAddress(msg.sender, customerId, v, r, s);
  }
}