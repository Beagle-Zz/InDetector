contract c12396{
  /**
  * @dev Claim all vested tokens up to current date
  */
  function claim(address _to) internal {
    uint256 numberOfGrants = grants[_to].length;
    if (numberOfGrants == 0) {
      return;
    }
    uint256 claimable = 0;
    uint256 claimableFor = 0;
    for (uint256 i = 0; i < numberOfGrants; i++) {
      claimableFor = calculateVestedTokens(
        grants[_to][i].value,
        grants[_to][i].vesting,
        grants[_to][i].start,
        grants[_to][i].claimed
      );
      claimable = claimable.add(claimableFor);
      grants[_to][i].claimed = grants[_to][i].claimed.add(claimableFor);
    }
    token.transfer(_to, claimable);
    circulatingSupply += claimable;
    NewTokenClaim(_to, claimable);
  }
}