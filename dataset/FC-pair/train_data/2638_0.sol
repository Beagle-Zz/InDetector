contract c2638{
  // Makes sure that player profit can't exceed a maximum amount,
  //  that the bet size is valid, and the playerNumber is in range.
  modifier betIsValid(uint _betSize, uint _playerNumber) {
     require( calculateProfit(_betSize, _playerNumber) < maxProfit
             && _betSize >= minBet
             && _playerNumber > minNumber
             && _playerNumber < maxNumber);
    _;
  }
}