contract c18661{
  // @dev Grant acess to mint heroes.
  function grantAccessMint(address _address)
    onlyOwner
    public
  {
    mintAccess[_address] = true;
  }
}