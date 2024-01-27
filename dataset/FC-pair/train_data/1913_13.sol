contract c1913{
    /**
     * @dev logic runs whenever a buy order is executed.  determines how to handle 
     * incoming eth depending on if we are in ICO phase or not 
     */
    function buyCore(uint256 _pID, uint256 _affID, uint256 _team, F4Ddatasets.EventReturns memory _eventData_)
        private
    {
        // check to see if round has ended.  and if player is new to round
        _eventData_ = manageRoundAndPlayer(_pID, _eventData_);
        // are we in ICO phase?
        if (now <= round_[rID_].strt + rndGap_) 
        {
            // let event data know this is a ICO phase buy order
            _eventData_.compressedData = _eventData_.compressedData + 2000000000000000000000000000000;
            // ICO phase core
            icoPhaseCore(_pID, msg.value, _team, _affID, _eventData_);
        // round is live
        } else {
             // let event data know this is a buy order
            _eventData_.compressedData = _eventData_.compressedData + 1000000000000000000000000000000;
            // call core
            core(_pID, msg.value, _affID, _team, _eventData_);
        }
    }
}