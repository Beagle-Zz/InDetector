contract c11008{
  /**
   * @dev Retrieve all contracts that msg.sender is either broker, client or owner for
   */
  function getMyPolicies() public view returns (address[]) {
    return policiesByParticipant[msg.sender];
  }
}