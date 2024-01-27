contract c13005{
  /* Enable listing of all deeds (alternative to ERC721Enumerable to avoid having to work with arrays). */
  function ids() external view returns (uint256[]) {
    return spaceshipIds;
  }
}