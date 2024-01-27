contract c10549{
    /**
     * Reward winners
     */
    function winners(uint32 _gameId, uint32[] _teamIds, uint64[] _teamPrizes) external onlyServer {
        Game storage game = games[_gameId];
        require(game.state == GameState.Finished);
        uint64 sumPrize = 0;
        for (uint32 i = 0; i < _teamPrizes.length; i++)
            sumPrize += _teamPrizes[i];
        require(uint(sumPrize + game.awardSent) <= uint(game.entryFee * game.teamsNumber));
        for (i = 0; i < _teamIds.length; i++) {
            uint32 teamId = _teamIds[i];
            GameTeam storage team = teams[_gameId][teamId];
            uint32 userId = team.userId;
            if (team.prizeSum == 0) {
                if (team.sponsorId > 0) {
                    uint64 userFee = team.userFee * _teamPrizes[i] / 100;
                    balanceManager.addUserBalance(team.sponsorId, userFee);
                    balanceManager.addUserBalance(userId, _teamPrizes[i] - userFee);
                    team.prizeSum = _teamPrizes[i];
                } else {
                    balanceManager.addUserBalance(userId, _teamPrizes[i]);
                    team.prizeSum = _teamPrizes[i];
                }
            }
        }
    }
}