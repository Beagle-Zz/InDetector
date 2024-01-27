contract c10549{
    /**
     * Participate game
     */
    function participateGame(
        uint32 _gameId,
        uint32 _teamId,
        uint32 _userId,
        uint32 _sponsorId
    )
    external
    onlyServer
    {
        Game storage game = games[_gameId];
        require(
            _gameId > 0
            && game.state == GameState.Initialized
            && _teamId > 0
            && _userId > 0
            && teams[_gameId][_teamId].userId == 0
            && game.registrationDueDate > uint32(now)
        );
        uint16 userFee = 0;
        if (_sponsorId > 0) {
            require(balanceManager.balances(_sponsorId) >= game.entryFee && investTerms[_sponsorId][_userId].amount > game.entryFee);
            balanceManager.spendUserBalance(_sponsorId, game.entryFee);
            investTerms[_sponsorId][_userId].amount -= game.entryFee;
            userFee = investTerms[_sponsorId][_userId].userFee;
        }
        else {
            require(balanceManager.balances(_userId) >= game.entryFee);
            balanceManager.spendUserBalance(_userId, game.entryFee);
        }
        teams[_gameId][_teamId] = GameTeam(_userId, _sponsorId, 0, userFee);
        game.teamsNumber++;
    }
}