contract c3815{
  /**
    * Function to refund funds if softcap is not reached and sale period is over 
    */
  function refund() public saleIsUnsuccessful {
    uint value = investedAmountOf[msg.sender];
    investedAmountOf[msg.sender] = 0;
    msg.sender.transfer(value);
    InvestmentReturned(msg.sender, value, now);
  }
}