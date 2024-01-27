contract c498{
    /**
     * @dev decides if round end needs to be run & new round started.  and if
     * player unmasked earnings from previously played rounds need to be moved.
     */
    function managePlayer(uint256 _pID, SPCdatasets.EventReturns memory _eventData_)
        private
        returns (SPCdatasets.EventReturns)
    {
        uint256 temp_eth = 0;
        // if player has played a previous round, move their unmasked earnings
        // from that round to win vault. 
        if (plyr_[_pID].lrnd != 0)
        {
          updateGenVault(_pID, plyr_[_pID].lrnd);
          temp_eth = ((plyr_[_pID].win).add((plyr_[_pID].gen))).add(plyr_[_pID].aff);
          plyr_[_pID].gen = 0;
          plyr_[_pID].aff = 0;
          plyr_[_pID].win = temp_eth;
        }
        // update player's last round played
        plyr_[_pID].lrnd = rID_;
        // set the joined round bool to true
        _eventData_.compressedData = _eventData_.compressedData + 10;
        return(_eventData_);
    }
}