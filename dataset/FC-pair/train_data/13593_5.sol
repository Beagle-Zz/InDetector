contract c13593{
  /**
   * @dev Increases the number of tokens a spender is allowed to spend for
   * `msg.sender`
   * @param _spender address The address of the spender
   * @param _addedValue uint256 The amount to increase the spenders approval by
   */
  function increaseApproval(address _spender, uint256 _addedValue) public returns (bool) {
    allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
    Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }
}