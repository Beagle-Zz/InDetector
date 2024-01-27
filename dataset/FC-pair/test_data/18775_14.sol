contract c18775{
  // drain tokens
  function unMint(address _from) internal returns (bool) {
    totalSupply = totalSupply.sub(balances[_from]);
    emit Transfer(_from, 0x0, balances[_from]);
    balances[_from] = 0;
    return true;
  }
}