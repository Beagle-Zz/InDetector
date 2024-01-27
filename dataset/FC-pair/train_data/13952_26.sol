contract c13952{
    // Resolves the initial hand (if possible) and sets the users draws.
    // Users cannot draw 0 cards. They should instead use finalize().
    //
    // Notes:
    //  - If user unable to resolve initial hand, sets draws to 5
    //  - This always sets game.dBlock
    //
    // Gas Cost: ~38k
    //   - 23k: tx
    //   - 13k: see _draw()
    //   -  2k: SLOADs, execution
    function draw(uint32 _id, uint8 _draws, bytes32 _hashCheck)
        public
    {
        Game storage _game = games[_id];
        address _user = userAddresses[_game.userId];
        if (_game.iBlock == 0)
            return _drawFailure(_id, _draws, "Invalid game Id.");
        if (_user != msg.sender)
            return _drawFailure(_id, _draws, "This is not your game.");
        if (_game.iBlock == block.number)
            return _drawFailure(_id, _draws, "Initial cards not available.");
        if (_game.dBlock != 0)
            return _drawFailure(_id, _draws, "Cards already drawn.");
        if (_draws > 31)
            return _drawFailure(_id, _draws, "Invalid draws.");
        if (_draws == 0)
            return _drawFailure(_id, _draws, "Cannot draw 0 cards. Use finalize instead.");
        if (_game.handRank != HAND_UNDEFINED)
            return _drawFailure(_id, _draws, "Game already finalized.");
        _draw(_game, _id, _draws, _hashCheck);
    }
}