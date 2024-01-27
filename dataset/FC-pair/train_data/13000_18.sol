contract c13000{
  /// @dev checks if the instance of market maker contract is closed for public
  /// @param _token address address of the CC token.
  modifier marketClosed(address _token) {
  	require(!MarketMaker(currencyMap[_token].mmAddress).isOpenForPublic());
  	_;
  }
}