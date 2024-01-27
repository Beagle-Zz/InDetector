contract c40166{
   
   
  function shutdownTransactions() onlyOverseer {
    allowTransactions = false;
    TransactionsShutDown(msg.sender);
  }
}