contract c2954{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeExternal(uint256 _pID, uint256 _eth, uint256 _affID, LDdatasets.EventReturns memory _eventData_)
        private
        returns(LDdatasets.EventReturns)
    {
        // pay 5% out to community rewards
        uint256 _com = _eth * 5 / 100;
        // distribute share to affiliate
        uint256 _aff = _eth / 10;
        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            emit MonkeyEvents.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _pID, _aff, now);
        } else {
            // no affiliates, add to community
            _com += _aff;
        }
        if (!address(MonkeyKingCorp).call.value(_com)(bytes4(keccak256("deposit()"))))
        {
            // This ensures Team Just cannot influence the outcome of FoMo3D with
            // bank migrations by breaking outgoing transactions.
            // Something we would never do. But that's not the point.
            // We spent 2000$ in eth re-deploying just to patch this, we hold the 
            // highest belief that everything we create should be trustless.
            // Team JUST, The name you shouldn't have to trust.
        }
        return(_eventData_);
    }
}