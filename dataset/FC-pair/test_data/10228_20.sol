contract c10228{
  /**
   * @dev Get token estimate based on current rate
   * @param _weiAmount The amount of wei that will be sent
   */ 
  function estimate(uint256 _weiAmount) public view returns (uint256) {
    return _getTokenAmount(_weiAmount);
  }
}