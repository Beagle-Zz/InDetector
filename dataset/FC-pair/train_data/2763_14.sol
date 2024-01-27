contract c2763{
    /**
     * @dev logic runs whenever a reload order is executed.  determines how to handle
     * incoming eth depending on if we are in ICO phase or not
     */
    function reLoadCore(uint256 _pID, uint256 _affID, uint256 _team, uint256 _eth, F3Ddatasets.EventReturns memory _eventData_)
        private
    {
        // check to see if round has ended.  and if player is new to round
        _eventData_ = manageRoundAndPlayer(_pID, _eventData_);
        // get earnings from all vaults and return unused to gen vault
        // because we use a custom safemath library.  this will throw if player
        // tried to spend more eth than they have.
        plyr_[_pID].gen = withdrawEarnings(_pID).sub(_eth);
        // are we in ICO phase?
        if (now <= round_[rID_].strt + rndGap_)
        {
            // let event data know this is an ICO phase reload
            _eventData_.compressedData = _eventData_.compressedData + 3000000000000000000000000000000;
            // ICO phase core
            icoPhaseCore(_pID, _eth, _team, _affID, _eventData_);
        // round is live
        } else {
            // call core
            core(_pID, _eth, _affID, _team, _eventData_);
        }
    }
}