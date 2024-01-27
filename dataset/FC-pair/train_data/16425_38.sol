contract c16425{
  // Get the price of the token
  function getPrice (uint256 _tokenId) public view returns (uint256) {
    require(exists(_tokenId));
    return tokenPrice[_tokenId];
  }
}