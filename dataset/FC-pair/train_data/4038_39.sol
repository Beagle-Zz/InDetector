contract c4038{
  // @dev Revoke acess to deposit heroes.
  function revokeAccessDeposit(address _address)
    onlyOwner
    public
  {
    depositAccess[_address] = false;
  }
}