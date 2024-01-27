contract c2839{
    /**
     * @dev distributes eth based on fees to com, aff, and rp1
     */
    function distributeExternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, RP1datasets.EventReturns memory _eventData_)
        private
        returns(RP1datasets.EventReturns)
    {
        // pay 2% out to community rewards
        uint256 _com = _eth / 50;
        uint256 _rp1;
         //修改
        community_addr.transfer(_com);
        // pay 1% out to marketing
        uint256 _long = _eth / 100;
        //修改
        marketing_addr.transfer(_long);
        // distribute share to affiliate
        uint256 _aff = _eth / 10;
        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            emit RP1events.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _rID, _pID, _aff, now);
        } else {
            _rp1 = _aff;
        }
        // pay out rp1
        _rp1 = _rp1.add((_eth.mul(fees_[_team].rp1)) / (100));
        if (_rp1 > 0)
        {
            community_addr.transfer(_rp1);
            // set up event data
            _eventData_.rp1Amount = _rp1.add(_eventData_.rp1Amount);
        }
        return(_eventData_);
    }
}