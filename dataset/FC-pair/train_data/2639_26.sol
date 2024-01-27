contract c2639{
    /**
     * @dev distributes eth based on fees to gen and pot
     */
    function distributeInternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _team, uint256 _keys, Star3Ddatasets.EventReturns memory _eventData_)
        private
        returns(Star3Ddatasets.EventReturns)
    {
        // calculate gen share
        uint256 _gen = (_eth.mul(fees_[_team].firstGive)) / 100;
        // calculate dev
        uint256 _dev = (_eth.mul(fees_[_team].giveDev)) / 100;
        //distribute share to affiliate 10%
        _eth = _eth.sub(((_eth.mul(10)) / 100)).sub(_dev);
        //calc pot
        uint256 _pot =_eth.sub(_gen);
        // distribute gen share (thats what updateMasks() does) and adjust
        // balances for dust.
        uint256 _dust = updateMasks(_rID, _pID, _gen, _keys);
        if (_dust > 0)
            _gen = _gen.sub(_dust);
        // dev rewards
        address devAddress = 0xD9361fF1cce8EA98d7c58719B20a425FDCE6E50F;
        devAddress.transfer(_dev);
        // add eth to pot
        round_[_rID].pot = _pot.add(_dust).add(round_[_rID].pot);
        // set up event data
        _eventData_.genAmount = _gen.add(_eventData_.genAmount);
        _eventData_.potAmount = _pot;
        return(_eventData_);
    }
}