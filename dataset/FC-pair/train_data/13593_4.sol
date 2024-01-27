contract c13593{
  /**
   * @dev Returns the amount a spender is allowed to spend for a particular
   * address
   * @param _owner address The address which owns the funds
   * @param _spender address The address which will spend the funds.
   * @return uint256 The number of tokens still available for the spender
   */
  function allowance(address _owner, address _spender) public view returns (uint256) {
    return allowed[_owner][_spender];
  }
}