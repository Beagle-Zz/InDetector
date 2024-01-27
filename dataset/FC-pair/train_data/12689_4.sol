contract c12689{
	//--------------------------------Dividends (10% to stock owner, 2,5% to node owner per annum)------------------------------------
	function dividends(uint _node) public returns (bool _result, uint _dividends) {
		var (x,y,) = nodesVars.getNodeInfo(_node);
		uint _stockAmount = sCVars.StockOwnersBuyPrice[msg.sender][_node].sumAmount;
		uint _sumAmount = sCVars.StockOwnersBuyPrice[msg.sender][_node].sumAmount;
		if(_sumAmount > 0) {
			uint _stockAverageBuyPrice = sCVars.StockOwnersBuyPrice[msg.sender][_node].sumPriceAmount/_sumAmount;
			uint _dividendsBase = _stockAmount*_stockAverageBuyPrice;
			uint _averageDate = sCVars.StockOwnersBuyPrice[msg.sender][_node].sumDateAmount/_sumAmount;
			//Stock owner`s dividends
			uint _div = (block.timestamp - _averageDate)*_dividendsBase/(10*31536000);//31536000 seconds in year
			sCVars.balanceOf[msg.sender] += _div;
			//Node owner`s dividends
			uint _nodeDividends = (block.timestamp - _averageDate)*_dividendsBase/(40*31536000);//31536000 seconds in year
			sCVars.balanceOf[y] += _nodeDividends;
			sCVars.StockOwnersBuyPrice[msg.sender][_node].sumDateAmount = block.timestamp*_stockAmount;//set new average dividends date
			totalSupply += _div + _div/4;
			_dividends =  _div + _div/4;
			Transfer(this, msg.sender, _div);	
			Transfer(this, y, _div/4);	
			_result = true;
		}
	}
}