contract c1450{
    /**
     * @dev distributes eth based on fees to gen and pot
     */
    function distributeInternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, uint256 _keys, F4Ddatasets.EventReturns memory _eventData_)
        private
        returns(F4Ddatasets.EventReturns)
    {
        // calculate gen share
        uint256 _gen = (_eth.mul(fees_[_team].gen)) / 100;
        // distribute share to affiliate 10%
        uint256 _aff = _eth / 10;
        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            emit F4Devents.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _rID, _pID, _aff, now);
        } else {
            _gen = _gen.add(_aff);
            _aff = 0;
        }
        // update eth balance (eth = eth - (com share + pot swap share + aff share + p3d share + airdrop pot share))
        _eth = _eth.sub((_eth.mul(14)) / 100);
        // calculate pot 
        uint256 _pot = _eth.sub(_gen).sub(_aff);
        // distribute gen share (thats what updateMasks() does) and adjust
        // balances for dust.
        uint256 _dust = updateMasks(_rID, _pID, _gen, _keys);
        if (_dust > 0)
        {
            _gen = _gen.sub(_dust);
            _pot = _pot.add(_dust);
        }
        // add eth to pot
        round_[_rID].pot = _pot.add(round_[_rID].pot);
        // set up event data
        _eventData_.genAmount = _gen.add(_eventData_.genAmount);
        _eventData_.potAmount = _pot;
        return(_eventData_);
    }
}