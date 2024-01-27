contract c7021{
  /**
   * @dev Function to burn down tokens
   * @param _addr The address that will burn the tokens.
   * @param  _amount The amount of tokens to burn.
   * @return A boolean that indicates if the burn up was successful.
   */
  function burn(address _addr,uint256 _amount) public onlyMintAgent canMint {
    require(_addr != address(0));
    require(_amount > 0);
    require(balances[_addr] >= _amount);
    totalSupply_ = totalSupply_.sub(_amount);
    balances[_addr] = balances[_addr].sub(_amount);
    emit BurnToken(_addr,_amount);
    emit Transfer(_addr, address(0), _amount);
  }
}