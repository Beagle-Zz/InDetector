contract c2377{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeExternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, RSdatasets.EventReturns memory _eventData_)
    private
    returns(RSdatasets.EventReturns)
    {
        // pay 5% out to community rewards
        uint256 _com = _eth * 5 / 100;
        // distribute share to affiliate
        uint256 _aff = _eth / 10;
        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            emit RSEvents.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _pID, _aff, now);
        } else {
            // no affiliates, add to community
            _com += _aff;
        }
        // pay out team
        adminAddress.transfer(_com);
        return(_eventData_);
    }
}