contract c2294{
  /// @dev Overrides ERC20 interface to prevent interaction before finalization
  function transfer(address _to, uint256 _value) public isFinalized returns (bool) {
    return super.transfer(_to, _value);
  }
}