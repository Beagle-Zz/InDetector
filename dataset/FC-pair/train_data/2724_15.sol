contract c2724{
    /**
     * @dev this is the core logic for any buy/reload that happens while a round
     * is live.
     */
    function core(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, POOHMODatasets.EventReturns memory _eventData_)
        private
    {
        // if player is new to round
        if (plyrRnds_[_pID][_rID].keys == 0)
            _eventData_ = managePlayer(_pID, _eventData_);
        // early round eth limiter
        if (round_[_rID].eth < 100000000000000000000 && plyrRnds_[_pID][_rID].eth.add(_eth) > 5000000000000000000)
        {
            uint256 _availableLimit = (5000000000000000000).sub(plyrRnds_[_pID][_rID].eth);
            uint256 _refund = _eth.sub(_availableLimit);
            plyr_[_pID].gen = plyr_[_pID].gen.add(_refund);
            _eth = _availableLimit;
        }
        // if eth left is greater than min eth allowed (sorry no pocket lint)
        if (_eth > 1000000000)
        {
            // mint the new keys
            uint256 _keys = (round_[_rID].eth).keysRec(_eth);
            // if they bought at least 1 whole key
            if (_keys >= 1000000000000000000)
            {
            updateTimer(_keys, _rID);
            // set new leaders
            if (round_[_rID].plyr != _pID)
                round_[_rID].plyr = _pID;
            if (round_[_rID].team != _team)
                round_[_rID].team = _team;
            // set the new leader bool to true
            _eventData_.compressedData = _eventData_.compressedData + 100;
        }
            // update player
            plyrRnds_[_pID][_rID].keys = _keys.add(plyrRnds_[_pID][_rID].keys);
            plyrRnds_[_pID][_rID].eth = _eth.add(plyrRnds_[_pID][_rID].eth);
            // update round
            round_[_rID].keys = _keys.add(round_[_rID].keys);
            round_[_rID].eth = _eth.add(round_[_rID].eth);
            rndTmEth_[_rID][0] = _eth.add(rndTmEth_[_rID][0]);
            // distribute eth
            _eventData_ = distributeExternal(_rID, _pID, _eth, _affID, 0, _eventData_);
            _eventData_ = distributeInternal(_rID, _pID, _eth, 0, _keys, _eventData_);
            // call end tx function to fire end tx event.
		    endTx(_pID, 0, _eth, _keys, _eventData_);
        }
    }
}