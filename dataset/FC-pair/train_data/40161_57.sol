contract c40161{
   
   
  function shutdownTransactions() onlyOverseer {
    allowTransactions = false;
    TransactionsShutDown(msg.sender);
  }
}