contract c2249{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeExternal(uint256 _pID, uint256 _eth, uint256 _affID, RSdatasets.EventReturns memory _eventData_)
        private
        returns(RSdatasets.EventReturns)
    {
        // pay 5% out to community rewards
        uint256 _com = _eth * 2 / 100;//5%
        // distribute share to affiliate
        //uint256 _aff = _eth / 10;//10%
        uint256 _aff = 0;
        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            emit RSEvents.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _pID, _aff, now);
        } else {
            // no affiliates, add to community
            _com += _aff;
        }
        if (!address(RatKingCorp).call.value(_com)(bytes4(keccak256("deposit()"))))
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