contract c4038{
  // @dev Revoke acess to deploy heroes.
  function revokeAccessDeploy(address _address)
    onlyOwner
    public
  {
    deployAccess[_address] = false;
  }
}