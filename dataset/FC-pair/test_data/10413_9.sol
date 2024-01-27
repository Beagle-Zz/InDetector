contract c10413{
	/**
	 * WorkOrder Emission
	 */
	function buyForWorkOrder(
		uint256 _marketorderIdx,
		address _workerpool,
		address _app,
		address _dataset,
		string  _params,
		address _callback,
		address _beneficiary)
	external returns (address)
	{
		address requester = msg.sender;
		require(marketplace.consumeMarketOrderAsk(_marketorderIdx, requester, _workerpool));
		uint256 emitcost = lockWorkOrderCost(requester, _workerpool, _app, _dataset);
		WorkOrder workorder = new WorkOrder(
			_marketorderIdx,
			requester,
			_app,
			_dataset,
			_workerpool,
			emitcost,
			_params,
			_callback,
			_beneficiary
		);
		m_woidRegistered[workorder] = true;
		require(WorkerPool(_workerpool).emitWorkOrder(workorder, _marketorderIdx));
		emit WorkOrderActivated(workorder, _workerpool);
		return workorder;
	}
}