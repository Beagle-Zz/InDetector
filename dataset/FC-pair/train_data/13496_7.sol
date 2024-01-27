contract c13496{
  //ERC20 transfer
  function transfer(address _to, uint256 _value) whenNotPaused public returns (bool success)  {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);
    //REMOVED - SH 20180430 - WOULD PREVENT SENDING TO MULTISIG WALLET
    //require(isContract(_to) == false);
    require(!frozenAccount[msg.sender]);
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }
}