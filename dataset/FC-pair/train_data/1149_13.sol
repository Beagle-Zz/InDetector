contract c1149{
  // Only owner address can transfer ZTH
  function ownerTransferZTH(address sendTo, uint amount) public
  onlyOwner
  {
    // Safely update contract balance when sending out funds
    contractBalance = contractBalance.sub(amount);
    // update max profit
    setMaxProfit();
    require(ZTHTKN.transfer(sendTo, amount));
    emit LogOwnerTransfer(sendTo, amount);
  }
}