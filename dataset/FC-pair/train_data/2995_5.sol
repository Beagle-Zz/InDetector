contract c2995{
    /**
     * @dev withdraws all of your earnings.
     * -functionhash- 0x3ccfd60b
     */
    function withdraw()
        isActivated()
        isHuman()
        public
    {        
        // grab time
        uint256 _now = now;
        // fetch player ID
        uint256 _pID = pIDxAddr_[msg.sender];
        // setup temp var for player eth
        uint256 _eth;
        // check to see if round has ended and no one has run round end yet
        if (_now > round_.end && round_.ended == false && round_.plyr != 0)
        {
            // set up our tx event data
            RSdatasets.EventReturns memory _eventData_;
            // end the round (distributes pot)
			round_.ended = true;
            _eventData_ = endRound(_eventData_);
			// get their earnings
            _eth = withdrawEarnings(_pID);
            // gib moni
            if (_eth > 0)
                plyr_[_pID].addr.transfer(_eth);    
            // build event data
            _eventData_.compressedData = _eventData_.compressedData + (_now * 1000000000000000000);
            _eventData_.compressedIDs = _eventData_.compressedIDs + _pID;
            // fire withdraw and distribute event
            emit RSEvents.onWithdrawAndDistribute
            (
                msg.sender, 
                plyr_[_pID].name, 
                _eth, 
                _eventData_.compressedData, 
                _eventData_.compressedIDs, 
                _eventData_.winnerAddr, 
                _eventData_.winnerName, 
                _eventData_.amountWon, 
                _eventData_.newPot, 
                _eventData_.genAmount
            );
        // in any other situation
        } else {
            // get their earnings
            _eth = withdrawEarnings(_pID);
            // gib moni
            if (_eth > 0)
                plyr_[_pID].addr.transfer(_eth);
            // fire withdraw event
            emit RSEvents.onWithdraw(_pID, msg.sender, plyr_[_pID].name, _eth, _now);
        }
    }
}