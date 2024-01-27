contract c3936{
  /**
   * @dev Throws if called by other account than broker or client
   */
  modifier participantOnly() {
    require(msg.sender == clientEtherAddress || msg.sender == brokerEtherAddress);
    _;
  }
}