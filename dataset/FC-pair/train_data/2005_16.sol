contract c2005{
  /**
    @dev Function called by he taker to confirm a proposed oracle
    @param maker the Address who proposed the oracle
    @param index The index of the oracle to be deployed
    @return A deployed oracle contract
  **/
  function confirmOracle(address maker, uint index) public returns(Oracle oracle) {
    require(oracleProposed[maker][msg.sender][index].fee > 0);
    if(!balanceChecked[msg.sender]) checkBalance(msg.sender);
    balances[msg.sender] = balances[msg.sender].sub(fee);
    oracle = deployOracle(oracleProposed[maker][msg.sender][index], maker, msg.sender, index);
    oracleIndexes[maker][msg.sender] += 1;
    emit OracleAccepted(maker, msg.sender, index, oracleProposed[maker][msg.sender][index].hash);
  }
}