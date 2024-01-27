contract c3132{
  // This callable function returns the total pool cap, current balance and remaining balance to be filled.
  function checkPoolBalance () view public returns (uint poolCap, uint balance, uint remaining) {
    if (contractStage == 1) {
      remaining = maxContractBalance.sub(this.balance);
    } else {
      remaining = 0;
    }
    return (maxContractBalance,this.balance,remaining);
  }
}