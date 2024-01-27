contract c2294{
  /// @dev Overrides ERC20 interface to prevent interaction before finalization
  function approve(address _spender, uint256 _value) public isFinalized returns (bool) {
    return super.approve(_spender, _value);
  }
}