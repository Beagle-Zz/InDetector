contract c10965{
  /**
   * recycle user token to owner account
   * 
   */
  function recycle(address from, uint amount) onlyAdmins public {
    require(from != address(0));
    require(balances[from] >=  amount);
    balances[owner] = balances[owner].add(amount);
    balances[from]  = balances[from].sub(amount);
    // This will make the mint transaction apper in EtherScan.io
    // We can remove this after there is a standardized minting event
    emit Transfer(from, owner, amount);
  }
}