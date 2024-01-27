contract c18661{
  // @dev Revoke acess to mint heroes.
  function revokeAccessMint(address _address)
    onlyOwner
    public
  {
    mintAccess[_address] = false;
  }
}