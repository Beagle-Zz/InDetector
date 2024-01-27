contract c4166{
  /**
   * @dev Returns an URI for a given token ID
   * @dev Throws if the token ID does not exist.
   *
   * @dev To save on gas, we will host a standard metadata endpoint for each token.
   *  For Collector privacy, specific token metadata is stored off chain, which means
   *  the metadata returned by this endpoint cannot include specific details about
   *  the physical asset the token represents unless the Collector has made it public.
   *
   * @dev This metadata will be a JSON blob that includes:
   *  name - Codex Record
   *  description - Information about the Provider that is hosting the off-chain metadata
   *  imageUri - A generic Codex Record image
   *
   * @param _tokenId uint256 ID of the token to query
   */
  function tokenURI(
    uint256 _tokenId
  )
    public
    view
    returns (string)
  {
    bytes memory prefix = bytes(tokenURIPrefix);
    if (prefix.length == 0) {
      return "";
    }
    // Rather than store a string representation of _tokenId, we just convert it on the fly
    // since this is just a 'view' function (i.e., there's no gas cost if called off chain)
    bytes memory tokenId = uint2bytes(_tokenId);
    bytes memory output = new bytes(prefix.length + tokenId.length);
    // Index counters
    uint256 i;
    uint256 outputIndex = 0;
    // Copy over the prefix into the new bytes array
    for (i = 0; i < prefix.length; i++) {
      output[outputIndex++] = prefix[i];
    }
    // Copy over the tokenId into the new bytes array
    for (i = 0; i < tokenId.length; i++) {
      output[outputIndex++] = tokenId[i];
    }
    return string(output);
  }
}