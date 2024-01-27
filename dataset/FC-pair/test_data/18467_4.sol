contract c18467{
  // Internal function for handling eth deposits during contract stage one.
  function _ethDeposit () internal {
    assert (contractStage == 1);  
    uint size;
    address addr = msg.sender;
    assembly { size := extcodesize(addr) }
    require (size == 0);
    require (this.balance <= maxContractBalance);
    var c = contributorMap[msg.sender];
    uint newBalance = c.balance.add(msg.value);
    require (newBalance >= contributionMin);
    c.balance = newBalance;
    ContributorBalanceChanged(msg.sender, newBalance);
  }
}