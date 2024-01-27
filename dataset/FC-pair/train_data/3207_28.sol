contract c3207{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeExternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, Suohadatasets.EventReturns memory _eventData_)
        private
        returns(Suohadatasets.EventReturns)
    {
        // pay 2% out to community rewards
        uint256 _com = _eth / 50;
        // distribute share to affiliate
        uint256 _aff = _eth / 5;
        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            emit Suohaevents.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _rID, _pID, _aff, now);
        } else {
            _com = _com.add(_aff);
        }
        community_addr.transfer(_com);
        return(_eventData_);
    }
}