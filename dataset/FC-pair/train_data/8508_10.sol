contract c8508{
  /**
   * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   */
  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }
}