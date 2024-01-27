contract c13952{
    // Callable any time after the initial hand. Will assume
    // no draws if called directly after new hand.
    //
    // Gas Cost: 44k (loss), 59k (win, has credits), 72k (win, no credits)
    //   - 22k: tx overhead
    //   - 21k, 36k, 49k: see _finalize()
    //   -  1k: SLOADs, execution
    function finalize(uint32 _id, bytes32 _hashCheck)
        public
        returns (bool _didFinalize)
    {
        Game storage _game = games[_id];
        address _user = userAddresses[_game.userId];
        if (_game.iBlock == 0)
            return _finalizeFailure(_id, "Invalid game Id.");
        if (_user != msg.sender)
            return _finalizeFailure(_id, "This is not your game.");
        if (_game.iBlock == block.number)
            return _finalizeFailure(_id, "Initial hand not avaiable.");
        if (_game.dBlock == block.number)
            return _finalizeFailure(_id, "Drawn cards not available.");
        if (_game.handRank != HAND_UNDEFINED)
            return _finalizeFailure(_id, "Game already finalized.");
        _finalize(_game, _id, _hashCheck);
        return true;
    }
}