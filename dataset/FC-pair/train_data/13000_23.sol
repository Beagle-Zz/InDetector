contract c13000{
  /// @dev ERC223 transferAndCall, send cln to the market maker contract can only be called by owner (see MarketMaker)
  /// @dev sending CLN will return CC from the reserve to the sender.
  /// @param _token address address of the cc token managed by this factory.
  function insertCLNtoMarketMaker(address _token) public
                                  tokenPayable
                                  CLNOnly
                                  tokenIssuerOnly(_token, tkn.sender)
                                  returns (uint256 _subTokenAmount) {
  	address marketMakerAddress = getMarketMakerAddressFromToken(_token);
  	require(ERC20(clnAddress).approve(marketMakerAddress, tkn.value));
  	_subTokenAmount = IEllipseMarketMaker(marketMakerAddress).change(clnAddress, tkn.value, _token);
    require(ERC20(_token).transfer(tkn.sender, _subTokenAmount));
  }
}