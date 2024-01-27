contract c40166{
   
   
  function shutdownTransactions(address currency) onlyOverseer {
    address backend = DCAsset(currency).backendContract();
    DCAssetBackend(backend).shutdownTransactions();
    TransactionsShutDown(msg.sender);
  }
}