contract c13012{
  /// @dev checks if the instance of market maker contract is open for public
  /// @param _token address address of the CC token.
  modifier marketOpen(address _token) {
    require(MarketMaker(currencyMap[_token].mmAddress).isOpenForPublic());
    _;
  }
}