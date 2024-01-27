contract c11654{
  /**
  * @notice Enable or disable approval for a third party ("operator") to manage all your assets
  * @dev Emits the ApprovalForAll event
  * @param _to Address to add to the set of authorized operators.
  * @param _approved True if the operators is approved, false to revoke approval
  */
  function setApprovalForAll(address _to, bool _approved)
    external
  {
    if(_approved) {
      approveAll(_to);
    } else {
      disapproveAll(_to);
    }
  }
}