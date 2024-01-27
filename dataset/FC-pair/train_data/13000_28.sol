contract c13000{
  /// @dev sets tokenURI for the given currency, can be used during the sell only
  /// @param _token address address of the token to update
  /// @param _tokenURI string the URI may point to a JSON file that conforms to the "Metadata JSON Schema".
  function setTokenURI(address _token, string _tokenURI) public
                              tokenIssuerOnly(_token, msg.sender)
                              marketClosed(_token)
                              returns (bool) {
    ColuLocalCurrency(_token).setTokenURI(_tokenURI);
    return true;
  }
}