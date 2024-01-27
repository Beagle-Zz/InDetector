contract c16524{
  /// @notice This function is copy-paste of the generateTokens of the original MiniMi contract
  ///   except it uses mayGenerate modifier (original uses onlyController)
  function generate_token_for(address _addrTo, uint256 _amount) mayGenerate returns (bool) {
    //balances[_addr] += _amount;
    uint256 curTotalSupply = totalSupply();
    require(curTotalSupply + _amount >= curTotalSupply); // Check for overflow    
    uint256 previousBalanceTo = balanceOf(_addrTo);
    require(previousBalanceTo + _amount >= previousBalanceTo); // Check for overflow
    updateValueAtNow(totalSupplyHistory, curTotalSupply + _amount);
    updateValueAtNow(balances[_addrTo], previousBalanceTo + _amount);
    Transfer(0, _addrTo, _amount);
    return true;
  }
}