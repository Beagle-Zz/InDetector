contract c16401{
  /**
  * @dev Guarantees msg.sender is owner of the given deed
  * @param _deedId uint256 ID of the deed to validate its ownership belongs to msg.sender
  */
  modifier onlyOwnerOf(uint256 _deedId) {
    require(deedOwner[_deedId] == msg.sender);
    _;
  }
}