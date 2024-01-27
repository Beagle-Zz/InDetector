contract c3103{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeExternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, F3Ddatasets.EventReturns memory _eventData_)
        private
        returns(F3Ddatasets.EventReturns)
    {
        // pay 4% out to community rewards
        uint256 _com = _eth / 25;
        // distribute share to affiliate 13%
        uint256 _aff = (_eth.mul(13)) / 100; 
        // decide what to do with affiliate share of fees
        if (_affID != _pID ) {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            emit ONEevents.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _rID, _pID, _aff, now);
        } else {
            _com = _com.add(_aff);
        }
        //deposite com
        if (!address(One_Island_Inc).call.value(_com)(bytes4(keccak256("deposit()"))))
        {
            airDropPot_ = airDropPot_.add(_com);
            _com = 0;
        }
        return(_eventData_);
    }
}