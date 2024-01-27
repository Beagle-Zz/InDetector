contract c11251{
  /// @dev invoke onTransfer function before actual transfer function is executed.
  function transfer(address _to, uint256 _value) public returns (bool) {
    if (isContract(owner)) { // owner should be able to generate tokens
      require(balanceOf(msg.sender) >= _value);
      require(TokenController(owner).onTransfer(msg.sender, _to, _value));
    }
    return super.transfer(_to, _value);
  }
}