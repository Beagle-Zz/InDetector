contract c10413{
	/**
	 * Market orders
	 */
	function createMarketOrder(
		IexecLib.MarketOrderDirectionEnum _direction,
		uint256 _category,
		uint256 _trust,
		uint256 _value,
		address _workerpool,
		uint256 _volume)
	public returns (uint)
	{
		require(iexecHubInterface.existingCategory(_category));
		require(_volume >0);
		m_orderCount = m_orderCount.add(1);
		IexecLib.MarketOrder storage marketorder    = m_orderBook[m_orderCount];
		marketorder.direction      = _direction;
		marketorder.category       = _category;
		marketorder.trust          = _trust;
		marketorder.value          = _value;
		marketorder.volume         = _volume;
		marketorder.remaining      = _volume;
		if (_direction == IexecLib.MarketOrderDirectionEnum.ASK)
		{
			require(WorkerPool(_workerpool).m_owner() == msg.sender);
			require(iexecHubInterface.lockForOrder(msg.sender, _value.percentage(ASK_STAKE_RATIO).mul(_volume))); // mul must be done after percentage to avoid rounding errors
			marketorder.workerpool      = _workerpool;
			marketorder.workerpoolOwner = msg.sender;
		}
		else
		{
			// no BID implementation
			revert();
		}
		emit MarketOrderCreated(m_orderCount);
		return m_orderCount;
	}
}