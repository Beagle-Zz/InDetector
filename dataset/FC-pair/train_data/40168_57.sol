contract c40168{
   
   
  function shutdownTransactions() onlyOverseer {
    allowTransactions = false;
    TransactionsShutDown(msg.sender);
  }
}