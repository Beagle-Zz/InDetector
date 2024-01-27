contract c40176{
   
  function transferFromTreasury(address to, uint256 amount) multisig(sha3(msg.data)) {
    assert(treasuryBalance >= amount);
    treasuryBalance -= amount;
    balanceOf[to] += amount;
    activateAccount(to);
  }
}