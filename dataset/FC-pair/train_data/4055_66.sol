contract c4055{
  // @dev Get the token id of the player's #th token.
  function getTokenIdOfAddressAndIndex(address _address, uint256 _index)
    external view
    returns (uint256)
  {
    return tokensOf(_address)[_index];
  }
}