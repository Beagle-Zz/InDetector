contract c3665{
  // Revokes a prior confirmation of the given operation
  function revoke(bytes32 _operation) external onlyOwner {
    emit Revoke(msg.sender, _operation);
    delete m_pending[_operation];
  }
}