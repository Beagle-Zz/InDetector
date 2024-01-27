contract c3048{
    /**
     * @dev this is the core logic for any buy/reload that happens while a round 
     * is live.
     */
    function core(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, F3Ddatasets.EventReturns memory _eventData_)
        private
    {
        // if player is new to round
        if (plyrRnds_[_pID][_rID].keys == 0)
            _eventData_ = managePlayer(_pID, _eventData_);
        // if eth left is greater than min eth allowed (sorry no pocket lint)
        if (_eth > 1000000000) 
        {
            // mint the new keys
            uint256 _keys = (_eth.mul(1000000000000000000) / round_[_rID].keyPrice);
            // if they bought at least 1 whole key
            if (_keys >= 1000000000000000000)
            {
            round_[_rID].keyPrice = round_[_rID].keyPrice.add(10000000000000);//update key price
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
            rndTmEth_[_rID][_team] = _eth.add(rndTmEth_[_rID][_team]);
            // distribute eth
            _eventData_ = distributeExternal(_rID, _pID, _eth, _affID, _eventData_);
            _eventData_ = distributeInternal(_rID, _pID, _eth, _team, _keys, _eventData_);
            // call end tx function to fire end tx event.
		    endTx(_pID, _team, _eth, _keys, _eventData_);
        }
    }
}