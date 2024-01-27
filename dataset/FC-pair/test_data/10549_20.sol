contract c10549{
    /**
     * Refund money for cancelled game
     */
    function refundCancelledGame(uint32 _gameId, uint32[] _teamIds) external onlyServer {
        Game storage game = games[_gameId];
        require(game.state == GameState.Cancelled);
        for (uint32 i = 0; i < _teamIds.length; i++) {
            uint32 teamId = _teamIds[i];
            GameTeam storage team = teams[_gameId][teamId];
            require(teams[_gameId][teamId].prizeSum == 0);
            if (team.prizeSum == 0) {
                if (team.sponsorId > 0) {
                    balanceManager.addUserBalance(team.sponsorId, game.entryFee);
                } else {
                    balanceManager.addUserBalance(team.userId, game.entryFee);
                }
                team.prizeSum = game.entryFee;
            }
        }
    }
}