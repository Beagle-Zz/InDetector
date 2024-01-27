contract c16097{
  /**
   * @dev Gets a list of token IDs owned by the requested address
   * @param _owner address owning the tokens list to be accessed
   * @return uint256[] list of token IDs owned by the requested address
   */
  function tokensOf(address _owner) public view returns (uint256[]) {
    return ownedTokens[_owner];
  }
}