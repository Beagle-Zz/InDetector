contract c13012{
  /// @dev create the MarketMaker and the CC token put all the CC token in the Market Maker reserve
  /// @param _name string name for CC token that is created.
  /// @param _symbol string symbol for CC token that is created.
  /// @param _decimals uint8 percison for CC token that is created.
  /// @param _totalSupply uint256 total supply of the CC token that is created.
  function createCurrency(string _name,
                          string _symbol,
                          uint8 _decimals,
                          uint256 _totalSupply) public
                          returns (address) {
    return createCurrency(_name, _symbol, _decimals, _totalSupply, '');
  }
}