contract c13520{
	//------------------------------------------------------Starmid exchange----------------------------------------------------------
	function stockTransfer(address _to, uint _node, uint _value) public {
		require(_to != 0x0);
        require(sCVars.stockBalanceOf[msg.sender][_node] >= _value && sCVars.stockBalanceOf[_to][_node] + _value > sCVars.stockBalanceOf[_to][_node]);
		var (x,y,) = nodesVars.getNodeInfo(_node);
		require(msg.sender != y);//nodeOwner cannot transfer his stocks, only sell
		sCVars.stockBalanceOf[msg.sender][_node] -= _value;
        sCVars.stockBalanceOf[_to][_node] += _value;
        StockTransfer(msg.sender, _to, _node, _value);
	}
}