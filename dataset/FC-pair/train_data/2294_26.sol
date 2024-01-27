contract c2294{
  /// @dev Overrides ERC20 interface to prevent interaction before finalization
  function transferFrom(address _from, address _to, uint256 _value) public isFinalized returns (bool) {
    return super.transferFrom(_from, _to, _value);
  }
}