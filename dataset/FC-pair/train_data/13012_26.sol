contract c13012{
  /// @dev opens the Market Maker to recvice transactions from all sources.
  /// @dev Request to transfer ownership of Market Maker contract to Owner instead of factory.
  /// @param _token address address of the cc token managed by this factory.
  function openMarket(address _token) public
                      tokenIssuerOnly(_token, msg.sender)
                      returns (bool) {
  	address marketMakerAddress = getMarketMakerAddressFromToken(_token);
  	require(MarketMaker(marketMakerAddress).openForPublicTrade());
  	Ownable(marketMakerAddress).requestOwnershipTransfer(msg.sender);
    Ownable(_token).requestOwnershipTransfer(msg.sender);
  	MarketOpen(marketMakerAddress);
  	return true;
  }
}