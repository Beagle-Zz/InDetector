contract c2978{
  /**
  * Returns token holder Led Token balance
  * @param _owner {address} Token holder address
  * @return balance {uint256} Corresponding token holder balance
  */
  function balanceOf(address _owner) public constant returns (uint256) {
    return ledToken.balanceOf(_owner);
  }
}