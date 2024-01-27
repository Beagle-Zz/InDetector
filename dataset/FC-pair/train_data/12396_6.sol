contract c12396{
  /**
  * @dev Get all veted tokens
  */
  function totalVestedTokens() public constant returns (uint256) {
    address _to = msg.sender;
    uint256 numberOfGrants = grants[_to].length;
    if (numberOfGrants == 0) {
      return 0;
    }
    uint256 claimable = 0;
    for (uint256 i = 0; i < numberOfGrants; i++) {
      claimable = claimable.add(
        grants[_to][i].value.sub(grants[_to][i].claimed)
      );
    }
    return claimable;
  }
}