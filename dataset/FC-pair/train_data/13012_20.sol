contract c13012{
  /// @dev create the MarketMaker and the CC token put all the CC token in the Market Maker reserve
  /// @param _name string name for CC token that is created.
  /// @param _symbol string symbol for CC token that is created.
  /// @param _decimals uint8 percison for CC token that is created.
  /// @param _totalSupply uint256 total supply of the CC token that is created.
  /// @param _tokenURI string the URI may point to a JSON file that conforms to the "Metadata JSON Schema".
  function createCurrency(string _name,
                          string _symbol,
                          uint8 _decimals,
                          uint256 _totalSupply,
                          string _tokenURI) public
                          returns (address) {
  	ColuLocalCurrency subToken = new ColuLocalCurrency(_name, _symbol, _decimals, _totalSupply, _tokenURI);
  	EllipseMarketMaker newMarketMaker = new EllipseMarketMaker(mmLibAddress, clnAddress, subToken);
  	//set allowance
  	require(subToken.transfer(newMarketMaker, _totalSupply));
  	require(IEllipseMarketMaker(newMarketMaker).initializeAfterTransfer());
  	currencyMap[subToken] = CurrencyStruct({ name: _name, decimals: _decimals, totalSupply: _totalSupply, mmAddress: newMarketMaker, owner: msg.sender});
    tokens.push(subToken);
  	TokenCreated(subToken, msg.sender);
  	return subToken;
  }
}