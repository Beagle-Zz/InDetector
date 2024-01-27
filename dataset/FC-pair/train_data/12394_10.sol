contract c12394{
  /**
   * @dev Extend OpenZeppelin's BasicToken transfer function to store snapshot
   * @param _to The address to transfer to.
   * @param _value The amount to be transferred.
   */
  function transfer(address _to, uint256 _value) public returns (bool) {
    takeSnapshot(msg.sender);
    takeSnapshot(_to);
    return BasicToken.transfer(_to, _value);
  }
}