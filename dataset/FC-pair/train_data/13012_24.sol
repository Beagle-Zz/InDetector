contract c13012{
  /// @dev normal send cc to the market maker contract, sender must approve() before calling method. can only be called by owner
  /// @dev sending CC will return CLN from the reserve to the sender.
  /// @param _token address address of the cc token managed by this factory.
  /// @param _ccAmount uint256 amount of CC to transfer into the Market Maker reserve.
  function extractCLNfromMarketMaker(address _token,
                                     uint256 _ccAmount) public
                                     tokenIssuerOnly(_token, msg.sender)
                                     returns (uint256 _clnTokenAmount) {
  	address marketMakerAddress = getMarketMakerAddressFromToken(_token);
  	require(ERC20(_token).transferFrom(msg.sender, this, _ccAmount));
  	require(ERC20(_token).approve(marketMakerAddress, _ccAmount));
  	_clnTokenAmount = IEllipseMarketMaker(marketMakerAddress).change(_token, _ccAmount, clnAddress);
  	require(ERC20(clnAddress).transfer(msg.sender, _clnTokenAmount));
  }
}