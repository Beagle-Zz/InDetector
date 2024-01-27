contract c12669{
  // Allow the system to create transactions for transfers when appropriate.
  // (e.g. upgrading the token for everyone, voting to recover accounts for lost private keys, 
  //    allowing the system to pay for transactions on someones behalf, allowing transaction automations)
  // (Must be voted for on an approved contract to gain access to this function)
  function contractTransfer(address _from, address _to, uint256 _value) public onlyContract returns (bool) {
    require(_from != address(0));
    require(_to != address(0));
    require(_value > 0);
    require(_value <= balances[_from]);
    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    ContractTransfer(_from, _to, _value); // Notify blockchain the following transaction was contract initiated
    Transfer(_from, _to, _value); // Call original transfer event to maintain compatibility with stardard transaction systems
    return true;
  }
}