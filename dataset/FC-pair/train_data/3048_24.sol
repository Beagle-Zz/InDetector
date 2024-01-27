contract c3048{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeExternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, F3Ddatasets.EventReturns memory _eventData_)
        private
        returns(F3Ddatasets.EventReturns)
    {
        // pay 7% out to community rewards
        uint256 _com = _eth * 7 / 100;
        comB_=comB_.add(_com);
        // distribute share to affiliate
        uint256 _aff = _eth / 10;
        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && _affID != 0) {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            plyr_[_pID].laff=_affID;
            emit F3Devents.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _rID, _pID, _aff, now);
        } else {
             plyr_[1].gen=plyr_[1].gen.add(_aff);
        }
        return(_eventData_);
    }
}