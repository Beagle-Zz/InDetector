contract c2658{
  /*
   * TODO comment this Norsefire, I have no idea how it works
   */
  function calculateProfit(uint _initBet, uint _roll)
    private
    view
    returns (uint)
  {
    return ((((_initBet * (101 - (_roll.sub(1)))) / (_roll.sub(1)) + _initBet)) * houseEdge / houseEdgeDivisor) - _initBet;
  }
}