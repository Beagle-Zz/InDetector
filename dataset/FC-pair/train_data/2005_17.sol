contract c2005{
  /**
    @dev Function to propose an oracle, calle by maker
    @param _ipfsHash The hash for the bug information(description, spurce code, etc)
    @param taker the Address who needs to accept the oracle
    @return index of the proposal
  **/
  function buyOracle(bytes _ipfsHash, address taker) public whenOpen returns (uint index){
    if(!balanceChecked[msg.sender]) checkBalance(msg.sender);
    balances[msg.sender] = balances[msg.sender].sub(fee);
    index = oracleIndexes[msg.sender][taker];
    oracleProposed[msg.sender][taker][index] = proposal(_ipfsHash, oracleMasterCopy, fee);
    emit OracleProposed(msg.sender, taker, index, _ipfsHash);
  }
}