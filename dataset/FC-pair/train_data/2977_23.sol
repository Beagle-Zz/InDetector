contract c2977{
  /**
  * Standard ERC20 allowance function
  * @param _owner {address}
  * @param _spender {address}
  * @return remaining {uint256}
   */
  function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
    return allowed[_owner][_spender];
  }
}