contract c10965{
  /**
   * Create new tokens and allocate them to an address..
   *
   * Only callably by a crowdsale contract (mint agent). 
   */
  function mint(address receiver, uint amount) onlyMintAgent canMint public {
    //totalsupply is not changed, send amount TTG to receiver from owner account.
    balances[owner] = balances[owner].sub(amount);
    balances[receiver] = balances[receiver].plus(amount);
    // This will make the mint transaction apper in EtherScan.io
    // We can remove this after there is a standardized minting event
    emit Transfer(0, receiver, amount);
  }
}