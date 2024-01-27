contract c559{
	    /**
     * @dev essentially the same as buy, but instead of you sending ether
     * from your wallet, it uses your unwithdrawn earnings.
     * -functionhash- 0x349cdcac (using ID for affiliate)
     * -functionhash- 0x82bfc739 (using address for affiliate)
     * -functionhash- 0x079ce327 (using name for affiliate)
     * @param _affCode the ID/address/name of the player who gets the affiliate fee
     * @param _team what team is the player playing for?
     * @param _eth amount of earnings to use (remainder returned to gen vault)
     */
    /**
     * @dev withdraws all of your earnings.
     * -functionhash- 0x3ccfd60b
     */
    function withdraw()
        isActivated()
        isHuman()
        public
    {
		// setup local rID
        uint256 myrID = rID_;
        // grab time
        uint256 _now = now;
        // fetch player ID
        uint256 _pID = pIDxAddr_[msg.sender];
        // setup temp var for player eth
        uint256 upperLimit = 0;
        uint256 usedGen = 0;
        // eth send to player
        uint256 ethout = 0;   
        uint256 over_gen = 0;
        updateGenVault(_pID, plyr_[_pID].lrnd);
        if (plyr_[_pID].gen > 0)
        {
          upperLimit = (calceth(plyrRnds_[_pID][myrID].keys).mul(105))/100;
          if(plyr_[_pID].gen >= upperLimit)
          {
            over_gen = (plyr_[_pID].gen).sub(upperLimit);
            round_[myrID].keys = (round_[myrID].keys).sub(plyrRnds_[_pID][myrID].keys);
            plyrRnds_[_pID][myrID].keys = 0;
            round_[myrID].pot = (round_[myrID].pot).add(over_gen);
            usedGen = upperLimit;       
          }
          else
          {
            plyrRnds_[_pID][myrID].keys = (plyrRnds_[_pID][myrID].keys).sub(calckeys(((plyr_[_pID].gen).mul(100))/105));
            round_[myrID].keys = (round_[myrID].keys).sub(calckeys(((plyr_[_pID].gen).mul(100))/105));
            usedGen = plyr_[_pID].gen;
          }
          ethout = ((plyr_[_pID].win).add(plyr_[_pID].aff)).add(usedGen);
        }
        else
        {
          ethout = ((plyr_[_pID].win).add(plyr_[_pID].aff));
        }
        plyr_[_pID].win = 0;
        plyr_[_pID].gen = 0;
        plyr_[_pID].aff = 0;
        plyr_[_pID].addr.transfer(ethout);
        // check to see if round has ended and no one has run round end yet
        if (_now > round_[myrID].end && round_[myrID].ended == false && round_[myrID].plyr != 0)
        {
            // set up our tx event data
            SPCdatasets.EventReturns memory _eventData_;
            // end the round (distributes pot)
            round_[myrID].ended = true;
            _eventData_ = endRound(_eventData_);
            // build event data
            _eventData_.compressedData = _eventData_.compressedData + (_now * 1000000000000000000);
            _eventData_.compressedIDs = _eventData_.compressedIDs + _pID;
            // fire withdraw and distribute event
            emit SPCevents.onWithdrawAndDistribute
            (
                msg.sender,
                plyr_[_pID].name,
                ethout,
                _eventData_.compressedData,
                _eventData_.compressedIDs,
                _eventData_.winnerAddr,
                _eventData_.winnerName,
                _eventData_.amountWon,
                _eventData_.newPot,
                _eventData_.P3DAmount,
                _eventData_.genAmount
            );
        // in any other situation
        } else {
            // fire withdraw event
            emit SPCevents.onWithdraw(_pID, msg.sender, plyr_[_pID].name, ethout, _now);
        }
    }
}