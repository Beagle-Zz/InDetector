contract c1302{
    /**
     * @dev this is the core logic for any buy/reload that happens while a round 
     * is live.
     */
    function core(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, J3Ddatasets.EventReturns memory _eventData_)
        private
    {
    	//uint256 a = 1;
        // if player is new to round
        if (plyrRnds_[_pID][_rID].keys == 0)
            _eventData_ = managePlayer(_pID, _eventData_);
        // early round eth limiter 
        if (round_[_rID].eth < 50000000000000000000 && plyrRnds_[_pID][_rID].eth.add(_eth) > 2000000000000000000)
        {
            uint256 _availableLimit = (2000000000000000000).sub(plyrRnds_[_pID][_rID].eth);
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
				if(janwin(round_[_rID].team,_team))
				{
					uint _janprice;
					if (_eth >= 10000000000000000000)
                	{
                    	// calculate prize and give it to winner
                    	_janprice = ((janPot_).mul(75)) / 100;
                    	plyr_[_pID].win = (plyr_[_pID].win).add(_janprice);
                    	// adjust airDropPot 
                    	janPot_ = (janPot_).sub(_janprice);
                    	// let event know a tier 3 prize was won 
                    	//_eventData_.compressedData += 300000000000000000000000000000000;
                	} else if (_eth >= 1000000000000000000 && _eth < 10000000000000000000) {
                    	// calculate prize and give it to winner
                    	_janprice = ((janPot_).mul(50)) / 100;
                    	plyr_[_pID].win = (plyr_[_pID].win).add(_janprice);
                    	// adjust airDropPot 
                    	janPot_ = (janPot_).sub(_janprice);
                    	// let event know a tier 2 prize was won 
                    	//_eventData_.compressedData += 200000000000000000000000000000000;
                	} else if (_eth >= 100000000000000000 && _eth < 1000000000000000000) {
                    	// calculate prize and give it to winner
                    	_janprice = ((janPot_).mul(25)) / 100;
                    	plyr_[_pID].win = (plyr_[_pID].win).add(_janprice);
                    	// adjust airDropPot 
                    	janPot_ = (janPot_).sub(_janprice);
                    	// let event know a tier 3 prize was won 
                    	//_eventData_.compressedData += 300000000000000000000000000000000;
                	}
                	if(_janprice > 0){
                		// fired whenever an janwin is paid
    					 emit J3Devents.onNewJanWin(
    					 	_rID,
    					 	_pID,
    					 	plyr_[_pID].addr,
    					 	plyr_[_pID].name,
    					 	_janprice,
    					 	now
    					 );
                	}
				}
            	// set new leaders
            	if (round_[_rID].plyr != _pID)
                	round_[_rID].plyr = _pID;  
            	if (round_[_rID].team != _team)
                	round_[_rID].team = _team; 
            	// set the new leader bool to true
            	_eventData_.compressedData = _eventData_.compressedData + 100;
        	}
            // store the air drop tracker number (number of buys since last airdrop)
            //_eventData_.compressedData = _eventData_.compressedData + (airDropTracker_ * 1000);
            // update player 
            plyrRnds_[_pID][_rID].keys = _keys.add(plyrRnds_[_pID][_rID].keys);
            plyrRnds_[_pID][_rID].eth = _eth.add(plyrRnds_[_pID][_rID].eth);
            // update round
            round_[_rID].keys = _keys.add(round_[_rID].keys);
            round_[_rID].eth = _eth.add(round_[_rID].eth);
            rndTmEth_[_rID][_team] = _eth.add(rndTmEth_[_rID][_team]);
            // distribute eth
            _eventData_ = distributeExternal(_rID, _pID, _eth, _affID, _team, _eventData_);
            _eventData_ = distributeInternal(_rID, _pID, _eth, _team, _keys, _eventData_);
            // call end tx function to fire end tx event.
		    endTx(_pID, _team, _eth, _keys, _eventData_);
        }
    }
}