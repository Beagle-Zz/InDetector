contract c3486{
  /**
  * @dev Current token is not transferred.
  * After start official token sale CSCT, you can exchange your tokens
  */
  function transfer(address, uint256) public returns (bool) {
    revert();
    return false;
  }
}