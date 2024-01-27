contract c10414{
	/**
	 * Worker subscription
	 */
	function registerToPool(address _worker) public returns (bool subscribed)
	// msg.sender = workerPool
	{
		WorkerPool workerpool = WorkerPool(msg.sender);
		// Check credentials
		require(workerPoolHub.isWorkerPoolRegistered(msg.sender));
		// Lock worker deposit
		require(lock(_worker, workerpool.m_subscriptionLockStakePolicy()));
		// Check subscription policy
		require(m_accounts[_worker].stake >= workerpool.m_subscriptionMinimumStakePolicy());
		require(m_scores[_worker]         >= workerpool.m_subscriptionMinimumScorePolicy());
		// Update affectation
		require(workerPoolHub.registerWorkerAffectation(msg.sender, _worker));
		// Trigger event notice
		emit WorkerPoolSubscription(msg.sender, _worker);
		return true;
	}
}