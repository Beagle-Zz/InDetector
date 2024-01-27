contract c11251{
  /// @dev invoke onTransfer function before actual transfer function is executed.
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    if (isContract(owner)) { // owner should be able to generate tokens
      require(balanceOf(_from) >= _value);
      require(TokenController(owner).onTransfer(_from, _to, _value));
    }
    return super.transferFrom(_from, _to, _value);
  }
}