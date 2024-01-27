contract c1966{
    // returns current game state
    function getGameState(address player) public view returns
            (GameState, uint, BetDirection, uint, uint8, uint8, uint) {
        return (
            gamesInProgress[player].state,
            gamesInProgress[player].id,
            gamesInProgress[player].direction,
            gamesInProgress[player].bet,
            gamesInProgress[player].firstRoll,
            gamesInProgress[player].finalRoll,
            gamesInProgress[player].winnings
        );
    }
}