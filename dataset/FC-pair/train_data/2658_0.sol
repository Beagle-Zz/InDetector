contract c2658{
  /*
   * checks player profit, bet size and player number is within range
  */
  modifier betIsValid(uint _betSize, uint _playerNumber) {
     require( calculateProfit(_betSize, _playerNumber) < maxProfit
             && _betSize >= minBet
             && _playerNumber > minNumber
             && _playerNumber < maxNumber);
    _;
  }
}