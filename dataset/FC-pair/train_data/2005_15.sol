contract c2005{
  /**
    @dev Internal function to deploy and register a oracle
    @param _proposal A proposal struct containing the bug information
    @param maker the Address who proposed the oracle
    @param taker the Address who accepted the oracle
    @param index The index of the oracle to be deployed
    @return A deployed oracle contract
  **/
  function deployOracle(proposal _proposal, address maker, address taker, uint256 index) internal returns(Oracle oracle){
    require(oracleDeployed[maker][taker][index] == address(0));
    oracle = CentralizedBugOracle(new CentralizedBugOracleProxy(_proposal.oracleMasterCopy, owner, _proposal.hash, maker, taker));
    oracleDeployed[maker][taker][index] = oracle;
    emit OracleDeployed(maker, taker, index, _proposal.hash, oracle);
  }
}