contract c498{
    /**
     * @dev distributes eth based on fees to gen and pot
     */
    function distributeInternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _team, uint256 _keys, SPCdatasets.EventReturns memory _eventData_)
        private
        returns(SPCdatasets.EventReturns)
    {
        // calculate gen share，80%
        uint256 _gen = (_eth.mul(fees_[2].gen)) / 100;
        // pot 5%
        uint256 _pot = (_eth.mul(5)) / 100;
        // distribute gen share (thats what updateMasks() does) and adjust
        // balances for dust.
        uint256 _dust = updateMasks(_rID, _pID, _gen, _keys);
        if (_dust > 0)
            _gen = _gen.sub(_dust);
        // add eth to pot
        round_[_rID].pot = _pot.add(round_[_rID].pot);
        // set up event data
        _eventData_.genAmount = _gen.add(_eventData_.genAmount);
        _eventData_.potAmount = _pot;
        return(_eventData_);
    }
}