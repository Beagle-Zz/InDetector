contract c13012{
  /// @dev normal send cln to the market maker contract, sender must approve() before calling method. can only be called by owner
  /// @dev sending CLN will return CC from the reserve to the sender.
  /// @param _token address address of the cc token managed by this factory.
  /// @param _clnAmount uint256 amount of CLN to transfer into the Market Maker reserve.
  function insertCLNtoMarketMaker(address _token,
                                  uint256 _clnAmount) public
                                  tokenIssuerOnly(_token, msg.sender)
                                  returns (uint256 _subTokenAmount) {
  	require(_clnAmount > 0);
  	address marketMakerAddress = getMarketMakerAddressFromToken(_token);
  	require(ERC20(clnAddress).transferFrom(msg.sender, this, _clnAmount));
  	require(ERC20(clnAddress).approve(marketMakerAddress, _clnAmount));
  	_subTokenAmount = IEllipseMarketMaker(marketMakerAddress).change(clnAddress, _clnAmount, _token);
    require(ERC20(_token).transfer(msg.sender, _subTokenAmount));
  }
}