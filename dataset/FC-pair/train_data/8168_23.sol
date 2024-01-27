contract c8168{
  /**
  * @dev Issue tokens to specified wallet
  * @param _to Wallet address
  * @param _value Amount of tokens
  */
  function issue(address _to, uint256 _value) external onlyOwner canIssue returns (bool) {
    totalSupply = totalSupply.add(_value);
    balances[_to] = balances[_to].add(_value);
    emit Issue(_to, _value);
    emit Transfer(address(0), _to, _value);
    return true;
  }
}