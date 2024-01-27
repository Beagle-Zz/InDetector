contract c2294{
  /// @dev Overrides ERC223 interface to prevent interaction before finalization
  // solium-disable-next-line arg-overflow
  function transferFrom(address _from, address _to, uint256 _value, bytes _data) public isFinalized returns (bool) {
    return super.transferFrom(_from, _to, _value, _data); // solium-disable-line arg-overflow
  }
}