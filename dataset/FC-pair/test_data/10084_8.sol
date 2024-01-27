contract c10084{
    // Which game ID has a player last computed their score up to
    //   using the updateScore function?
    function playerLastScoredGame(address _player)
        public
        view
        returns (int8)
    {
        return playerGamesScored[_player];
    }
}