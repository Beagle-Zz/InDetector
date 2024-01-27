contract c4210{
  /**
   * @dev Function to burn down tokens
   * @param _addr The address that will burn the tokens.
   * @param  _amount The amount of tokens to burn.
   */
  function _burn(address _addr,uint256 _amount) internal  {
    require(balances[_addr] >= _amount);
    balances[_addr] = balances[_addr].sub(_amount);
    totalSupply_ = totalSupply_.sub(_amount);
    emit BurnToken(_addr,_amount);
    emit Transfer(_addr, address(0), _amount);
  }
}