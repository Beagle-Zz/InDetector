contract c3132{
  // This callable function returns the balance, contribution cap, and remaining available balance of any contributor.
  function checkContributorBalance (address addr) view public returns (uint balance, uint cap, uint remaining) {
    var c = whitelist[addr];
    if (contractStage == 2) return (c.balance,0,0);
    if (whitelistIsActive && whitelistContract.isPaidUntil(addr) < now) return (c.balance,0,0);
    if (c.cap > 0) cap = c.cap;
    else cap = contributionCap;
    if (cap.sub(c.balance) > maxContractBalance.sub(this.balance)) return (c.balance, cap, maxContractBalance.sub(this.balance));
    return (c.balance, cap, cap.sub(c.balance));
  }
}