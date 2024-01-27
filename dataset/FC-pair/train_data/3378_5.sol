contract c3378{
    // We loop through all of the players to get the main investor (the one with the largest amount of VTL Token)
    function GetMainInvestor() public view returns(uint[]) {
        uint depth = 10;
        bool[] memory _checkPlayerInRanking = new bool[] (players.length);
        uint[] memory curWinningVTLAmount = new uint[] (depth);
        uint[] memory curWinningPlayers = new uint[] (depth);
        // Loop through the depth to find the player for each rank
        for(uint j = 0; j < depth; j++) {
            // We reset some value
            curWinningVTLAmount[j] = 0;
            // We loop through all of the players
            for (uint8 i = 0; i < players.length; i++) {
                // Iterate through players and insert the current best at the correct position
                if(players[i].countVTL > curWinningVTLAmount[j] && _checkPlayerInRanking[i] != true) {
                    curWinningPlayers[j] = i;
                    curWinningVTLAmount[j] = players[i].countVTL;
                }
            }
            // We record that this player is in the ranking to make sure we don't integrate it multiple times in the ranking
            _checkPlayerInRanking[curWinningPlayers[j]] = true;
        }
        // We return the winning player
        return(curWinningPlayers);
    }
}