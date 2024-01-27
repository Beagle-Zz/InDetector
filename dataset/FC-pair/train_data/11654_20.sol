contract c11654{
  /**
  * @notice Approves another address to claim for the ownership of any tokens owned by this account
  * @param _to address to be approved for the given token ID
  */
  function approveAll(address _to)
    public
  {
    require(_to != msg.sender, "cant approve yourself");
    require(_to != address(0), "invalid owner");
    operatorApprovals[msg.sender][_to] = true;
    emit ApprovalForAll(msg.sender, _to, true);
  }
}