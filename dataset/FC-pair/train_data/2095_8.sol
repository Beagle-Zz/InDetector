contract c2095{
  /**
   * @dev approve before transfer
   */
  function approve(address to, uint256 token_id) external payable {
    require(msg.sender == stTokenIndexToOwner[token_id]);
    stTokenApprovals[token_id] = to;
    emit Approval(msg.sender, to, token_id);
  }
}