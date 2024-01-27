contract c3536{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeExternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, FFFdatasets.EventReturns memory _eventData_)
        private
        returns(FFFdatasets.EventReturns)
    {
        // pay 3% out to community rewards
        uint256 _p1 = _eth / 100;
        uint256 _com = _eth / 50;
        _com = _com.add(_p1);
        // distribute share to affiliate
        uint256 _aff = _eth / 10;
        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            emit FFFevents.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _rID, _pID, _aff, now);
        } else {
            _com = (_com.add(_aff));
        }
        // pay out p3d
        uint256 _p3d;
        _p3d = _p3d.add((_eth.mul(fees_[_team].p3d)) / (100));
        if (_p3d > 0)
        {
            // deposit to divies contract
            uint256 _potAmount = _p3d / 2;
            _com = (_com.add((_p3d.sub(_potAmount))));
            round_[_rID].pot = round_[_rID].pot.add(_potAmount);
            // set up event data
            _eventData_.P3DAmount = _p3d.add(_eventData_.P3DAmount);
        }
        yyyy.transfer((_com.mul(80)/100));
        gggg.transfer((_com.sub((_com.mul(80)/100))));
        return(_eventData_);
    }
}