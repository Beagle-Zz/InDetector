contract c12124{
  // This function is called to withdraw eth or tokens from the contract.
  // It can only be called by addresses that are whitelisted and show a balance greater than 0.
  // If called during stage one, the full eth balance deposited into the contract is returned and the contributor's balance reset to 0.
  // If called during stage two, the contributor's unused eth will be returned, as well as any available tokens.
  // The token address may be provided optionally to withdraw tokens that are not currently the default token (airdrops).
  function withdraw (address tokenAddr) public {
    var c = whitelist[msg.sender];
    require (c.balance > 0);
    if (contractStage == 1) {
      uint amountToTransfer = c.balance;
      c.balance = 0;
      msg.sender.transfer(amountToTransfer);
      ContributorBalanceChanged(msg.sender, 0);
    } else {
      _withdraw(msg.sender,tokenAddr);
    }  
  }
}