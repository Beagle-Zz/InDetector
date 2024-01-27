contract c7991{
  // Returns the total amounts betted
  // for the sender
  function getUserBet(address addr) public constant returns(uint[]) {
    uint[] memory bets = new uint[](2);
    bets[betterInfo[addr].betOption] = betterInfo[addr].betAmount;
    return bets;
  }
}