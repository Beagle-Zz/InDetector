contract c11008{
  /**
   * @dev Retrieve all contracts ever created
   */
  function getAllPolicies() public view ownerOnly returns (address[]){
    return policies;
  }
}