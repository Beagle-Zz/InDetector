contract c12357{
    //*********************************************
    // Query Functions
    //*********************************************
    function queryGameStatus(uint gameId) external view returns(uint8) {
        Game memory game = gameHistory[gameId];
        return uint8(game.status);
    }
}