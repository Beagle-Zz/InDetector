contract c248{
    /// @dev Join a game
    function joinGame(uint gameid, uint8 choice) public payable whenNotPaused returns (uint){
        Game storage game = games[gameid];
        require(msg.value == game.dealerValue && game.dealer != address(0) && game.dealer != msg.sender && game.playerChoice==NONE);
        require(game.player == address(0) || game.player == msg.sender);
        require(!game.closed);
        require(now < game.expireTime);
        require(checkChoice(choice));
        game.player = msg.sender;
        game.playerChoice = choice;
        game.playerValue = msg.value;
        game.expireTime = expireTimeLimit + now;
        gameidsOf[msg.sender].push(gameid);
        emit JoinGame(gameid, game.player, game.playerValue);
        return gameid;
    }
}