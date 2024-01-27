contract c13657{
  // Modifier that requires the trading to be live or
  // allowed to bypass the freeze status
  modifier tokenTradingMustBeLive(address sender) {
    require(tradingLive || freezeBypassing[sender]);
    _;
  }
}