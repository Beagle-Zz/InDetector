contract c16637{
  // As return statement unavailable in fallback, explicit the method here
  function hasConfirmed(bytes32 _operation, address _owner) external constant returns (bool) {
    return _walletLibrary.delegatecall(msg.data);
  }
}