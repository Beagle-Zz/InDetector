contract c3228{
    /**
     * @dev distributes eth based on fees to com, aff, and up
     */
    function distributeExternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, MC2datasets.EventReturns memory _eventData_)
        private
        returns(MC2datasets.EventReturns)
    {
        // pay 2% out to community rewards
        uint256 _com = _eth / 50;
        uint256 _up;
        if (!address(Jekyll_Island_Inc).call.value(_com)(bytes4(keccak256("deposit()"))))
        {
            // This ensures Team Just cannot influence the outcome of MC2 with
            // bank migrations by breaking outgoing transactions.
            // Something we would never do. But that's not the point.
            // We spent 2000$ in eth re-deploying just to patch this, we hold the 
            // highest belief that everything we create should be trustless.
            // Team JUST, The name you shouldn't have to trust.
            _up = _com;
            _com = 0;
        }
        // pay 1% out to MC2 short
        uint256 _long = _eth / 100;
        otherMC2_.potSwap.value(_long)();
        // distribute share to affiliate
        uint256 _aff = _eth / 10;
        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            emit MC2events.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _rID, _pID, _aff, now);
        } else {
            _up = _aff;
        }
        // pay out up
        _up = _up.add((_eth.mul(fees_[_team].up)) / (100));
        if (_up > 0)
        {
            // deposit to divies contract
            Divies.deposit.value(_up)();
            // set up event data
            _eventData_.UPAmount = _up.add(_eventData_.UPAmount);
        }
        return(_eventData_);
    }
}