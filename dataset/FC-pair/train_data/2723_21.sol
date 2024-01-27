contract c2723{
    /**
     * @dev gets existing or registers new pID.  use this when a player may be new
     * @return pID 
     */
    function determinePID(RSdatasets.EventReturns memory _eventData_)
        private
        returns (RSdatasets.EventReturns)
    {
        uint256 _pID = pIDxAddr_[msg.sender];
        // if player is new to this version of LastUnicorn
        if (_pID == 0)
        {
            // grab their player ID, name and last aff ID, from player names contract 
            _pID = UnicornBook.getPlayerID(msg.sender);
            bytes32 _name = UnicornBook.getPlayerName(_pID);
            uint256 _laff = UnicornBook.getPlayerLAff(_pID);
            // set up player account 
            pIDxAddr_[msg.sender] = _pID;
            plyr_[_pID].addr = msg.sender;
            if (_name != "")
            {
                pIDxName_[_name] = _pID;
                plyr_[_pID].name = _name;
                plyrNames_[_pID][_name] = true;
            }
            if (_laff != 0 && _laff != _pID)
                plyr_[_pID].laff = _laff;
            // set the new player bool to true
            _eventData_.compressedData = _eventData_.compressedData + 1;
        } 
        return (_eventData_);
    }
}