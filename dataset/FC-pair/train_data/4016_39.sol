contract c4016{
  // @dev Revoke acess to deposit heroes.
  function revokeAccessDeposit(address _address)
    onlyOwner
    public
  {
    depositAccess[_address] = false;
  }
}