contract c40166{
   
  function approve(address currency, address spender, uint256 amount) multisig(sha3(msg.data)) spendControl(currency, amount) onlyWithOversight {
    Token(currency).approve(spender, amount);
    PerformedApprove(spender, amount);
  }
}