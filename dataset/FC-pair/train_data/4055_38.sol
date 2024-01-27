contract c4055{
  // @dev Grant acess to deposit heroes.
  function grantAccessDeposit(address _address)
    onlyOwner
    public
  {
    depositAccess[_address] = true;
  }
}