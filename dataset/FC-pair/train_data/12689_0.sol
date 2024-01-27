contract c12689{
	//-----------------------------------------Starmid Exchange functions
	function stockMinSellPrice(StarCoinLibrary.Data storage self, uint _buyPrice, uint _node) constant returns (uint _minSellPrice) {
		_minSellPrice = _buyPrice + 1;
		for (uint i = 0; i < self.stockSellOrderPrices[_node].length; i++) {
			if(self.stockSellOrderPrices[_node][i] < _minSellPrice) _minSellPrice = self.stockSellOrderPrices[_node][i];
		}
	}
}