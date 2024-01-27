contract c2655{
    /**
     * @dev gets existing or registers new pID.  use this when a player may be new
     * @return pID
     */
    function determinePID(F3Ddatasets.EventReturns memory _eventData_)
        private
        returns (F3Ddatasets.EventReturns)
    {
        uint256 _pID = pIDxAddr_[msg.sender];
        // if player is new to this version of FOMO3TEST1d
        if (_pID == 0)
        {
            // grab their player ID, name and last aff ID, from player names contract
            _pID = getPlayerID(msg.sender);
            // set up player account
            pIDxAddr_[msg.sender] = _pID;
            plyr_[_pID].addr = msg.sender;
            // set the new player bool to true
            _eventData_.compressedData = _eventData_.compressedData + 1;
        }
        return (_eventData_);
    }
}