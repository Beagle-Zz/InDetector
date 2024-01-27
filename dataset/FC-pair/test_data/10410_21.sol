contract c10410{
	// if sheduler never call finalized ? no incetive to do that. schedulermust be pay also at this time
	function finalizeWork(address _woid, string _stdout, string _stderr, string _uri) public onlyOwner /*onlySheduler*/ returns (bool)
	{
		require(iexecHubInterface.isWoidRegistred(_woid));
		IexecLib.Consensus storage consensus = m_consensus[_woid];
		require(now <= consensus.consensusTimeout);
		require((consensus.revealDate <= now && consensus.revealCounter > 0) || (consensus.revealCounter == consensus.winnerCount)); // consensus.winnerCount never 0 at this step
		// add penalized to the call worker to contribution and they never contribute ?
		require(distributeRewards(_woid, consensus));
		require(iexecHubInterface.finalizeWorkOrder(_woid, _stdout, _stderr, _uri));
		emit FinalizeWork(_woid,_stdout,_stderr,_uri);
		return true;
	}
}