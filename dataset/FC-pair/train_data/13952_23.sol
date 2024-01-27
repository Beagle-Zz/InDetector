contract c13952{
    // Allows a user to create a game from Ether sent.
    //
    // Gas Cost: 55k (prev player), 95k (new player)
    //   - 22k: tx overhead
    //   - 26k, 66k: see _createNewGame()
    //   -  3k: event
    //   -  2k: curMaxBet()
    //   -  2k: SLOAD, execution
    function bet()
        public
        payable
    {
        uint _bet = msg.value;
        if (_bet > settings.maxBet)
            return _betFailure("Bet too large.", _bet, true);
        if (_bet < settings.minBet)
            return _betFailure("Bet too small.", _bet, true);
        if (_bet > curMaxBet())
            return _betFailure("The bankroll is too low.", _bet, true);
        // no uint64 overflow: _bet < maxBet < .625 ETH < 2e64
        uint32 _id = _createNewGame(uint64(_bet));
        emit BetSuccess(now, msg.sender, _id, _bet, settings.curPayTableId);
    }
}