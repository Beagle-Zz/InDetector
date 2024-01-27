contract c3727{
     // Return list of players
    function getPlayers() public view returns (address[]) {
        return playerList;
    }
}