contract c16401{
  /**
  * @dev Gets the owner of the specified deed ID
  * @param _deedId uint256 ID of the deed to query the owner of
  * @return owner address currently marked as the owner of the given deed ID
  */
  function ownerOf(uint256 _deedId)
  external view returns (address _owner) {
    require(deedOwner[_deedId] != address(0));
    _owner = deedOwner[_deedId];
  }
}