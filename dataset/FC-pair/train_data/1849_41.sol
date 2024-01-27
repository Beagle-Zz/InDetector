contract c1849{
  // @dev Grant acess to deploy heroes.
  function grantAccessDeploy(address _address)
    onlyOwner
    public
  {
    deployAccess[_address] = true;
  }
}