contract c40166{
   
  function approveAndCall(address currency, address spender, uint256 amount, bytes extraData) multisig(sha3(msg.data)) spendControl(currency, amount) onlyWithOversight {
    Token(currency).approveAndCall(spender, amount, extraData);
    PerformedApprove(spender, amount);
  }
}