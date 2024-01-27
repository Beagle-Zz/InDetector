contract c3730{
     // Return list of players
    function getPlayers() public view returns (address[]) {
        return playerList;
    }
}