contract c3204{
    /**
     * @dev decides if round end needs to be run & new round started.  and if
     * player unmasked earnings from previously played rounds need to be moved.
     */
    function managePlayer(uint256 _pID, F3Ddatasets.EventReturns memory _eventData_)
        private
        returns (F3Ddatasets.EventReturns)
    {
        // if player has played a previous round, move their unmasked earnings
        // from that round to gen vault.
        if (plyr_[_pID].lrnd != 0)
            updateGenVault(_pID, plyr_[_pID].lrnd);
        // update player's last round played
        plyr_[_pID].lrnd = rID_;
        // set the joined round bool to true
        _eventData_.compressedData = _eventData_.compressedData + 10;
        return(_eventData_);
    }
}