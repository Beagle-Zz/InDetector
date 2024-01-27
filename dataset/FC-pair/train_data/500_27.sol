contract c500{
    /**
     * @dev distributes eth based on fees to gen and pot
     */
    function distributeInternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _team, uint256 _keys, POOHMODatasets.EventReturns memory _eventData_)
        private
        returns(POOHMODatasets.EventReturns)
    {
        // calculate gen share
        uint256 _gen = (_eth.mul(fees_[_team].gen)) / 100;
        // update eth balance (eth = eth - (com share + pot swap share + aff share + p3d share + airdrop pot share))
        _eth = _eth.sub(((_eth.mul(14)) / 100).add((_eth.mul(fees_[_team].pooh)) / 100));
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