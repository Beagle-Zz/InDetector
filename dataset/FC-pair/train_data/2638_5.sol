contract c2638{
  // Calculate the maximum potential profit
  function calculateProfit(uint _initBet, uint _roll)
    private
    view
    returns (uint)
  {
    return ((((_initBet * (101 - (_roll.sub(1)))) / (_roll.sub(1)) + _initBet)) * houseEdge / houseEdgeDivisor) - _initBet;
  }
}