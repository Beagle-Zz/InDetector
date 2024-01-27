contract c2095{
  /**
   * @dev get approve
   */
  function getApproved(uint256 _tokenId) external view returns (address){
    return stTokenApprovals[_tokenId];
  }
}