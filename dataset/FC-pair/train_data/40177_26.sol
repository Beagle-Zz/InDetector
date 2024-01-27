contract c40177{
   
  function seizeTokens(address addr, uint256 amount) multisig(sha3(msg.data)) {
    assert(balanceOf[addr] >= amount);
    assert(frozenAccount[addr]);
    activateAccount(addr);
    balanceOf[addr] -= amount;
    treasuryBalance += amount;
  }
}