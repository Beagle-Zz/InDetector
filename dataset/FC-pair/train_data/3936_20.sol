contract c3936{
  /**
   * @dev Retrieve all contracts ever created
   */
  function getAllPolicies() public view ownerOnly returns (address[]){
    return policies;
  }
}