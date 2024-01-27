contract c8553{
  /* A dispense feature to allocate some addresses with Jcash tokens
  * calculation done using token count
  *  Can be called only by owner
  */
  function dispenseTokensToInvestorAddressesByValue(address[] _addresses, uint[] _value) onlyOwner returns (bool ok){
     require(_addresses.length == _value.length);
     for(uint256 i=0; i<_addresses.length; i++){
        onSaleTokens = safeSub(onSaleTokens, _value[i]);
        balances[_addresses[i]] = safeAdd(balances[_addresses[i]], _value[i]);
        balances[contractAddress] = safeSub(balances[contractAddress], _value[i]);
     }
     return true;
  }
}