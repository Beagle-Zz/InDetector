contract c11859{
  /**
   * @dev Authorize a third party operator to manage one particular asset
   * @param operator address to be approved
   * @param assetId asset to approve
   */
  function approve(address operator, uint256 assetId) external {
    address holder = _ownerOf(assetId);
    require(msg.sender == holder || _isApprovedForAll(msg.sender, holder));
    require(operator != holder);
    if (_getApprovedAddress(assetId) != operator) {
      _approval[assetId] = operator;
      emit Approval(holder, operator, assetId);
    }
  }
}