contract c13952{
    // Gets initialHand, and stores .draws and .dBlock.
    // Gas Cost: 13k
    //   - 3k: getHand()
    //   - 5k: 1 update: iHand, draws, dBlock
    //   - 3k: event: DrawSuccess
    //   - 2k: SLOADs, other
    function _draw(Game storage _game, uint32 _id, uint8 _draws, bytes32 _hashCheck)
        private
    {
        // assert hand is not already drawn
        assert(_game.dBlock == 0);
        // Deal the initial hand, or set draws to 5.
        uint32 _iHand;
        bytes32 _iBlockHash = blockhash(_game.iBlock);
        uint8 _warnCode;
        if (_iBlockHash != 0) {
            // Ensure they are drawing against expected hand
            if (_iBlockHash != _hashCheck) {
                return _drawFailure(_id, _draws, "HashCheck Failed. Try refreshing game.");
            }
            _iHand = getHand(uint(keccak256(_iBlockHash, _id)));
        } else {
            _warnCode = WARN_IHAND_TIMEOUT;
            _draws = 31;
        }
        // update game
        _game.iHand = _iHand;
        _game.draws = _draws;
        _game.dBlock = uint32(block.number);
        emit DrawSuccess(now, msg.sender, _id, _game.iHand, _draws, _warnCode);
    }
}