contract c10413{
	/**
	 * WorkOrder life cycle
	 */
	function claimFailedConsensus(address _woid)
	public onlyRegisteredWoid(_woid) returns (bool)
	{
		WorkOrder  workorder  = WorkOrder(_woid);
		require(workorder.m_requester() == msg.sender);
		WorkerPool workerpool = WorkerPool(workorder.m_workerpool());
		IexecLib.WorkOrderStatusEnum currentStatus = workorder.m_status();
		require(currentStatus == IexecLib.WorkOrderStatusEnum.ACTIVE || currentStatus == IexecLib.WorkOrderStatusEnum.REVEALING);
		// Unlock stakes for all workers
		require(workerpool.claimFailedConsensus(_woid));
		workorder.claim(); // revert on error
		/* uint256 value           = marketplace.getMarketOrderValue(workorder.m_marketorderIdx()); // revert if not exist */
		/* address workerpoolOwner = marketplace.getMarketOrderWorkerpoolOwner(workorder.m_marketorderIdx()); // revert if not exist */
		uint256 value;
		address workerpoolOwner;
		(,,,value,,,,workerpoolOwner) = marketplace.getMarketOrder(workorder.m_marketorderIdx()); // Single call cost less gas
		uint256 workerpoolStake = value.percentage(marketplace.ASK_STAKE_RATIO());
		require(unlock (workorder.m_requester(), value.add(workorder.m_emitcost()))); // UNLOCK THE FUNDS FOR REINBURSEMENT
		require(seize  (workerpoolOwner,         workerpoolStake));
		// put workerpoolOwner stake seize into iexecHub address for bonus for scheduler on next well finalized Task
		require(reward (this,                    workerpoolStake));
		require(lock   (this,                    workerpoolStake));
		emit WorkOrderClaimed(_woid, workorder.m_workerpool());
		return true;
	}
}