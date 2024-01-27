contract c1788{
    /**
     * @dev distributes eth based on fees to com, aff, and pooh
     */
    function distributeExternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, POHMODATASETS.EventReturns memory _eventData_)
        private
        returns(POHMODATASETS.EventReturns)
    {
        // pay 1% out to dev
        uint256 _dev = _eth / 100;  // 1%
        uint256 _PoC = 0;
        if (!address(admin).call.value(_dev)())
        {
            _PoC = _dev;
            _dev = 0;
        }
        // distribute share to affiliate
        uint256 _aff = _eth / 10;
        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            emit PoHEVENTS.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _rID, _pID, _aff, now);
        } else {
            _PoC = _PoC.add(_aff);
        }
        // pay out POOH
        _PoC = _PoC.add((_eth.mul(fees_[_team].pooh)) / (100));
        if (_PoC > 0)
        {
            // deposit to divies contract
            _POHWHALE.call.value(_PoC)(bytes4(keccak256("donate()")));
            // set up event data
            _eventData_.PoCAmount = _PoC.add(_eventData_.PoCAmount);
        }
        return(_eventData_);
    }
}