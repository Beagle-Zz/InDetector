contract c16401{
  /**
  * @dev Approves another address to claim for the ownership of the given deed ID
  * @param _to address to be approved for the given deed ID
  * @param _deedId uint256 ID of the deed to be approved
  */
  function approve(address _to, uint256 _deedId)
  external onlyOwnerOf(_deedId) payable {
    require(msg.value == 0);
    require(_to != msg.sender);
    if(_to != address(0) || approvedFor(_deedId) != address(0)) {
      emit Approval(msg.sender, _to, _deedId);
    }
    deedApprovedFor[_deedId] = _to;
  }
}