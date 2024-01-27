contract c3207{
    /**
     * @dev distributes eth based on fees to gen and pot
     */
    function distributeInternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _team, uint256 _keys, Suohadatasets.EventReturns memory _eventData_)
        private
        returns(Suohadatasets.EventReturns)
    {
        // calculate gen share
        uint256 _gen = (_eth.mul(fees_[_team].gen)) / 100;
        // toss 2% into airdrop pot 
        uint256 _air = (_eth / 50);
        airDropPot_ = airDropPot_.add(_air);
        // update eth balance (eth = eth - (com share + pot swap share + aff share + p3d share + airdrop pot share))
        _eth = _eth.sub(((_eth.mul(24)) / 100));
        // calculate pot 
        uint256 _pot = _eth.sub(_gen);
        // distribute gen share (thats what updateMasks() does) and adjust
        // balances for dust.
        uint256 _dust = updateMasks(_rID, _pID, _gen, _keys);
        if (_dust > 0)
            _gen = _gen.sub(_dust);
        // add eth to pot
        round_[_rID].pot = _pot.add(_dust).add(round_[_rID].pot);
        // set up event data
        _eventData_.genAmount = _gen.add(_eventData_.genAmount);
        _eventData_.potAmount = _pot;
        return(_eventData_);
    }
}