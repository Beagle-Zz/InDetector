contract c10410{
	/**
	 * Assets consumption
	 */
	function consumeMarketOrderAsk(
		uint256 _marketorderIdx,
		address _requester,
		address _workerpool)
	public onlyIexecHub returns (bool)
	{
		IexecLib.MarketOrder storage marketorder = m_orderBook[_marketorderIdx];
		require(marketorder.direction  == IexecLib.MarketOrderDirectionEnum.ASK);
		require(marketorder.remaining  >  0);
		require(marketorder.workerpool == _workerpool);
		marketorder.remaining = marketorder.remaining.sub(1);
		if (marketorder.remaining == 0)
		{
			marketorder.direction = IexecLib.MarketOrderDirectionEnum.CLOSED;
		}
		require(iexecHubInterface.lockForOrder(_requester, marketorder.value));
		emit MarketOrderAskConsume(_marketorderIdx, _requester);
		return true;
	}
}