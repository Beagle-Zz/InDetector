contract c18467{
  // This callable function returns the balance, contribution cap, and remaining available balance of any contributor.
  function checkContributorBalance (address addr) view public returns (uint balance, uint cap, uint remaining) {
    var c = contributorMap[addr];
    if (contractStage == 1) {
      remaining = maxContractBalance.sub(this.balance);
    } else {
      remaining = 0;
    }
    return (c.balance, maxContractBalance, remaining);
  }
}