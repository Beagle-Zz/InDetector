contract c2294{
  /// @dev Overrides ERC20 interface to prevent interaction before finalization
  function decreaseApproval(address _spender, uint256 _subtractedValue) public isFinalized returns (bool) {
    return super.decreaseApproval(_spender, _subtractedValue);
  }
}