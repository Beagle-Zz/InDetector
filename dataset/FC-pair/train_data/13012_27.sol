contract c13012{
  /// @dev implementation for standard 223 reciver.
  /// @param _token address of the token used with transferAndCall.
  function supportsToken(address _token) public constant returns (bool) {
  	return (clnAddress == _token || currencyMap[_token].totalSupply > 0);
  }
}