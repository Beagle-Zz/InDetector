contract c9588{
  // @dev Mint a new card.
  function mint(address _beneficiary, uint256 _amount, uint8 _rank)
    onlyAccessMint
    public
  {
    for (uint256 i = 0; i < _amount; i++) {
      _mint(_beneficiary, numberOfTokenId);
      tokenIdToRank[numberOfTokenId] = _rank;
      numberOfTokenId ++;
    }
  }
}