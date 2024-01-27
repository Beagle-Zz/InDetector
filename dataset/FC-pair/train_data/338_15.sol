contract c338{
    /// @dev Creator reveals game choice
    function reveal(uint gameid, uint8 choice, bytes32 randomSecret) public returns (bool) {
        Game storage game = games[gameid];
        bytes32 proof = getProof(msg.sender, choice, randomSecret);
        require(!game.closed);
        require(now < game.expireTime);
        require(game.dealerHash != 0x0);
        require(checkChoice(choice));
        require(checkChoice(game.playerChoice));
        require(game.dealer == msg.sender && proof == game.dealerHash );
        game.dealerChoice = choice;
        Reveal(gameid, msg.sender, choice);
        close(gameid);
        return true;
    }
}