contract c3765{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeExternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, F3Ddatasets.EventReturns memory _eventData_)
        private
        returns(F3Ddatasets.EventReturns)
    {
        // pay 3% out to community rewards
        uint256 _p1 = _eth / 100;
        uint256 _com = _eth / 50;
        _com = _com.add(_p1);
        uint256 _p3d;
        admin.transfer(_com);
        // distribute share to affiliate
        uint256 _aff = _eth / 10;
        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            emit F3Devents.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _rID, _pID, _aff, now);
        } else {
            _p3d = _aff;
        }
        // pay out p3d
        _p3d = _p3d.add((_eth.mul(fees_[_team].p3d)) / (100));
        if (_p3d > 0)
        {
            uint256 _maskAmount = _p3d/2;           
            round_[_rID].mask = _maskAmount.add(round_[_rID].mask);
            round_[_rID].pot = round_[_rID].pot.add(_p3d.sub(_maskAmount));
            // set up event data
            _eventData_.P3DAmount = _p3d.add(_eventData_.P3DAmount);
        }
        return(_eventData_);
    }
}