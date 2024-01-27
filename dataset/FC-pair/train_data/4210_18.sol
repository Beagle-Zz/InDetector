contract c4210{
  /**
   * @dev Function to distribute tokens
   * @param _to The address that will receive the distributed tokens.
   * @param _amount The amount of tokens to distribute.
   */
  function distribute(address _to, uint256 _amount) public onlyDistributor canDistribute {
    require(balances[address(this)] >= _amount);
    balances[address(this)] = balances[address(this)].sub(_amount);
    balances[_to] = balances[_to].add(_amount);
    emit Distribute(_to, _amount);
    emit Transfer(address(0), _to, _amount);
  }
}