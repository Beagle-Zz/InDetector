contract c7949{
  // Returns whether a user has withdrawn
  // money or not.
  function userHasWithdrawn(address addr) public constant returns(bool) {
    return betterInfo[addr].withdrawn;
  }
}