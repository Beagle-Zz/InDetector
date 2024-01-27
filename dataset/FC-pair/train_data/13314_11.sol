contract c13314{
  /* Query the number of tokens for which an address is locked. */
  function getLockBalance(address _owner) public view returns(uint256){
    return _lockupBalances[_owner];
  }
}