contract c3255{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeExternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, LOLdatasets.EventReturns memory _eventData_)
        private
        returns(LOLdatasets.EventReturns)
    {
        // pay 2% out to community rewards
        uint256 _com = _eth / 50;
        uint256 _p3d;
        // distribute share to affiliate
        uint256 _aff = _eth / 10;
        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            emit LOLevents.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _rID, _pID, _aff, now);
        } else {
            _com = _com.add(_aff);
        }
        address(lol_offical_bank).call.value(_com)(bytes4(keccak256("deposit()")));
        // pay out p3d
        //_p3d = _p3d.add((_eth.mul(fees_[_team].p3d)) / (100));
        //if (_p3d > 0)
        //{
            // deposit to divies contract nbnb
            //Divies.deposit.value(_p3d)(); 
            // set up event data
            //_eventData_.P3DAmount = _p3d.add(_eventData_.P3DAmount);
        //}
        return(_eventData_);
    }
}