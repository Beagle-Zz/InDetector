contract c7365{
  /**
   * @dev Get balance of a token owner
   * @param _owner address The address which one owns tokens
   */
  function balanceOf(address _owner) external constant returns (uint256 balance) {
    return balances[_owner];
   }
}