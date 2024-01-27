contract c7365{
  /**
   * @dev Supply tokens to ICO contract
   * @param _value uint256 amount of tokens to sell
   */
  function sell(uint256 _value) public onlyOwner returns (bool) {
    require(icoContract != address(0));
    require(_value <= balances[msg.sender] && balances[icoContract] + _value >= balances[icoContract]); 
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[icoContract] = balances[icoContract].add(_value);
    emit Sell(msg.sender, _value);
    return true;
  }
}