contract c13375{
    //VIEW APIs ENDS
    //GAME PLAY STARTS
    function startGame(uint256 _betAmount, bytes32 _encryptedChoice) public  payable costs(_betAmount) returns(uint _gameNumber) {
        address player = msg.sender;
        require(!suspended[player]);   
        require(_betAmount >= MINIMUM_COST_OF_BET);
        require(_betAmount <= MAXIMUM_COST_OF_BET);
        Game memory _game = Game(now, now, now, player, address(0), REGISTRATION_COST, K, STAGE_TIMEOUT, true, false, false);  
        games.push(_game); 
        Game storage game = games[games.length-1]; 
        game.registered[player] = true;
        game.bets[player] = Bet(_encryptedChoice, _betAmount, 0);                   
        totalGamesStarted[player] = totalGamesStarted[player] + 1;
        emit RegisterationOpened(games.length);
        return games.length;
    }
}