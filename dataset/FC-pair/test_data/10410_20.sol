contract c10410{
	/**************************** Works management *****************************/
	function emitWorkOrder(address _woid, uint256 _marketorderIdx) public onlyIexecHub returns (bool)
	{
		uint256 catid   = marketplaceInterface.getMarketOrderCategory(_marketorderIdx);
		uint256 timeout = iexecHubInterface.getCategoryWorkClockTimeRef(catid).mul(CONSENSUS_DURATION_RATIO).add(now);
		IexecLib.Consensus storage consensus = m_consensus[_woid];
		consensus.poolReward                 = marketplaceInterface.getMarketOrderValue(_marketorderIdx);
		consensus.workerpoolOwner            = marketplaceInterface.getMarketOrderWorkerpoolOwner(_marketorderIdx);
		consensus.stakeAmount                = consensus.poolReward.percentage(m_stakeRatioPolicy);
		consensus.consensusTimeout            = timeout;
		consensus.schedulerRewardRatioPolicy = m_schedulerRewardRatioPolicy;
		emit WorkOrderActive(_woid);
		return true;
	}
}