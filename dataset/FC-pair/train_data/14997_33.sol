contract c14997{
    // Resolves game based on .iHand and .draws, crediting user on a win.
    // This always sets game.dHand and game.handRank.
    //
    // There are four possible scenarios:
    //   User draws N cads, and dBlock is fresh:
    //     - draw N cards into iHand, this is dHand
    //   User draws N cards, and dBlock is too old:
    //     - set dHand to iHand (note: iHand may be empty)
    //   User draws 0 cards, and iBlock is fresh:
    //     - draw 5 cards into iHand, set dHand to iHand
    //   User draws 0 cards, and iBlock is too old:
    //     - fail: set draws to 5, return. (user should call finalize again)
    //
    // Gas Cost: 21k loss, 36k win, 49k new win
    //   - 6k: if draws > 0: drawToHand()
    //   - 7k: getHandRank()
    //   - 5k: 1 update: Game
    //   - 2k: FinalizeSuccess
    //   - 1k: SLOADs, execution
    //   On Win: +13k, or +28k
    //   - 5k: 1 updates: totalCredits, totalWon
    //   - 5k or 20k: 1 update/write to credits[user]
    //   - 2k: event: AccountCredited
    //   - 1k: SLOADs, execution
    function _finalize(Game storage _game, uint32 _id, bytes32 _hashCheck)
        private
    {
        // Require game is not already finalized
        assert(_game.handRank == HAND_UNDEFINED);
        // Compute _dHand
        address _user = userAddresses[_game.userId];
        bytes32 _blockhash;
        uint32 _dHand;
        uint32 _iHand;  // set if draws are 0, and iBlock is fresh
        uint8 _warnCode;
        if (_game.draws != 0) {
            _blockhash = blockhash(_game.dBlock);
            if (_blockhash != 0) {
                // draw cards to iHand, use as dHand
                _dHand = drawToHand(uint(keccak256(_blockhash, _id)), _game.iHand, _game.draws);
            } else {
                // cannot draw any cards. use iHand.
                if (_game.iHand != 0){
                    _dHand = _game.iHand;
                    _warnCode = WARN_DHAND_TIMEOUT;
                } else {
                    _dHand = 0;
                    _warnCode = WARN_BOTH_TIMEOUT;
                }
            }
        } else {
            _blockhash = blockhash(_game.iBlock);
            if (_blockhash != 0) {
                // ensure they are drawing against expected hand
                if (_blockhash != _hashCheck) {
                    _finalizeFailure(_id, "HashCheck Failed. Try refreshing game.");
                    return;
                }
                // draw 5 cards into iHand, use as dHand
                _iHand = getHand(uint(keccak256(_blockhash, _id)));
                _dHand = _iHand;
            } else {
                // can't finalize with iHand. Draw 5 cards.
                _finalizeFailure(_id, "Initial hand not available. Drawing 5 new cards.");
                _game.draws = 31;
                _game.dBlock = uint32(block.number);
                emit DrawSuccess(now, _user, _id, 0, 31, WARN_IHAND_TIMEOUT);
                return;
            }
        }
        // Compute _handRank. be sure dHand is not empty
        uint8 _handRank = _dHand == 0
            ? uint8(HAND_NOT_COMPUTABLE)
            : uint8(getHandRank(_dHand));
        // This only happens if draws==0, and iHand was drawable.
        if (_iHand > 0) _game.iHand = _iHand;
        // Always set dHand and handRank
        _game.dHand = _dHand;
        _game.handRank = _handRank;
        // Compute _payout, credit user, emit event.
        uint _payout = payTables[_game.payTableId][_handRank] * uint(_game.bet);
        if (_payout > 0) _creditUser(_user, _payout, _id);
        emit FinalizeSuccess(now, _user, _id, _game.dHand, _game.handRank, _payout, _warnCode);
    }
}