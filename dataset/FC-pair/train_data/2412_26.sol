contract c2412{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeExternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, BATMODatasets.EventReturns memory _eventData_)
        private
        returns(BATMODatasets.EventReturns)
    {
        // pay 3% out to community rewards
        uint256 _p1 = _eth / 100;  //  1%
        uint256 _dev = _eth / 50;  //  2%
        _dev = _dev.add(_p1);  //  1%  + 2% = 3%
        uint256 _OBOK;
        if (!address(admin).call.value(_dev/2)() && !address(admin2).call.value(_dev/2)())
        {
            _OBOK = _dev;
            _dev = 0;
        }
        // distribute share to affiliate
        uint256 _aff = _eth / 10;
        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            emit FOMOEvents.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _rID, _pID, _aff, now);
        } else {
            _OBOK = _aff;
        }
        // pay out obok
        _OBOK = _OBOK.add((_eth.mul(fees_[_team].obok)) / (100));
        if (_OBOK > 0)
        {
            // deposit to divies contract
            uint256 _potAmount = _OBOK / 2;
            address(ObokContract).call.value(_OBOK.sub(_potAmount))(bytes4(keccak256("donateDivs()")));
            round_[_rID].pot = round_[_rID].pot.add(_potAmount);
            // set up event data
            _eventData_.tokenAmount = _OBOK.add(_eventData_.tokenAmount);
        }
        return(_eventData_);
    }
}