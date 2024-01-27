contract c2294{
  /// @dev Overrides ERC20 interface to prevent interaction before finalization
  function increaseApproval(address _spender, uint256 _addedValue) public isFinalized returns (bool) {
    return super.increaseApproval(_spender, _addedValue);
  }
}