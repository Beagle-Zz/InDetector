contract c18467{
  // This function opens the contract up for token withdrawals.
  // It can only be called by the owner during stage 3.  The owner specifies the address of an ERC20 token
  // contract that this contract has a balance in, and optionally a bool to prevent this token from being
  // the default withdrawal (in the event of an airdrop, for example).
  function enableTokenWithdrawals (address tokenAddr, bool notDefault) public onlyOwner noReentrancy {
    require (contractStage == 3);
    if (notDefault) {
      require (activeToken != 0x00);
    } else {
      activeToken = tokenAddr;
    }
    var d = distributionMap[tokenAddr];    
    if (d.pct.length == 0) d.token = ERC20(tokenAddr);
    uint amount = d.token.balanceOf(this).sub(d.balanceRemaining);
    require (amount > 0);
    if (feePct > 0) {
      require (d.token.transfer(owner,_applyPct(amount, feePct)));
    }
    amount = d.token.balanceOf(this).sub(d.balanceRemaining);
    d.balanceRemaining = d.token.balanceOf(this);
    d.pct.push(_toPct(amount, finalBalance));
    WithdrawalsOpen(tokenAddr);
  }
}