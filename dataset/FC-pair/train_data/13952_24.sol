contract c13952{
    // Allows a user to create a game from Credits.
    //
    // Gas Cost: 61k
    //   - 22k: tx overhead
    //   - 26k: see _createNewGame()
    //   -  3k: event
    //   -  2k: curMaxBet()
    //   -  2k: 1 event: CreditsUsed
    //   -  5k: update credits[user]
    //   -  1k: SLOAD, execution
    function betWithCredits(uint64 _bet)
        public
    {
        if (_bet > settings.maxBet)
            return _betFailure("Bet too large.", _bet, false);
        if (_bet < settings.minBet)
            return _betFailure("Bet too small.", _bet, false);
        if (_bet > curMaxBet())
            return _betFailure("The bankroll is too low.", _bet, false);
        if (_bet > credits[msg.sender])
            return _betFailure("Insufficient credits", _bet, false);
        uint32 _id = _createNewGame(uint64(_bet));
        vars.totalCredits -= uint88(_bet);
        credits[msg.sender] -= _bet;
        emit CreditsUsed(now, msg.sender, _id, _bet);
        emit BetSuccess(now, msg.sender, _id, _bet, settings.curPayTableId);
    }
}