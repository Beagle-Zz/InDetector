contract c8643{
  /**
   * Get address of message sender.
   *
   * @return address of this smart contract
   */
  function messageSenderAddress () internal view returns (address) {
    return msg.sender;
  }
}