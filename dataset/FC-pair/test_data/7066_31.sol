contract c7066{
  /**
   * Set address of smart contract to delegate execution of delegatable methods
   * to.
   *
   * @param _delegate address of smart contract to delegate execution of
   * delegatable methods to, or zero to not delegate delegatable methods
   * execution.
   */
  function setDelegate (address _delegate) public {
    require (msg.sender == owner);
    if (delegate != _delegate) {
      delegate = _delegate;
      Delegation (delegate);
    }
  }
}