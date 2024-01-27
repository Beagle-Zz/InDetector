contract c1913{
    /**
     * @dev decides if round end needs to be run & new round started.  and if 
     * player unmasked earnings from previously played rounds need to be moved.
     */
    function manageRoundAndPlayer(uint256 _pID, F4Ddatasets.EventReturns memory _eventData_)
        private
        returns (F4Ddatasets.EventReturns)
    {
        // setup local rID
        uint256 _rID = rID_;
        // grab time
        uint256 _now = now;
        // check to see if round has ended.  we use > instead of >= so that LAST
        // second snipe tx can extend the round.
        if (_now > round_[_rID].end)
        {
            // check to see if round end has been run yet.  (distributes pot)
            if (round_[_rID].ended == false)
            {
                _eventData_ = endRound(_eventData_);
                round_[_rID].ended = true;
            }
            // start next round in ICO phase
            rID_++;
            _rID++;
            round_[_rID].strt = _now;
            round_[_rID].end = _now.add(rndInit_).add(rndGap_);
        }
        // is player new to round?
        if (plyr_[_pID].lrnd != _rID)
        {
            // if player has played a previous round, move their unmasked earnings
            // from that round to gen vault.
            if (plyr_[_pID].lrnd != 0)
                updateGenVault(_pID, plyr_[_pID].lrnd);
            // update player's last round played
            plyr_[_pID].lrnd = _rID;
            // set the joined round bool to true
            _eventData_.compressedData = _eventData_.compressedData + 10;
        }
        return(_eventData_);
    }
}