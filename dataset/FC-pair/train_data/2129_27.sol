contract c2129{
    /**
     * @dev ends the round. manages paying out winner/splitting up pot
     */
    function endRound(F3Ddatasets.EventReturns memory _eventData_)
        private
        returns (F3Ddatasets.EventReturns)
    {
        // setup local rID
        uint256 _rID = rID_;
        // grab our winning player and team id's
        //uint256 _winPID = round_[_rID].plyr;
        uint256 _winTID = round_[_rID].team;
        uint256 _maxEthPID = round_[_rID].maxEthPID;
        uint256 _maxAffPID = round_[_rID].maxAffPID;
        if(0 == _maxAffPID){ _maxAffPID = 1; }
        // grab our pot amount
        uint256 _pot = round_[_rID].pot;
        // calculate our winner, max buyer, max inviter share
        // uint256 _win = (_pot.mul(potToWinner_)) / 100;
        uint256 _maxEth = (_pot.mul(potToMaxEth_)) / 100;
        uint256 _maxAff = (_pot.mul(potToMaxAff_)) / 100;
        uint256 _res = _pot.sub(_win).sub(_maxEth);
        // // pay our winner
        // plyr_[_winPID].win = _win.add(plyr_[_winPID].win);
        // pay for maxEth player
        plyr_[_maxEthPID].win = _maxEth.add(plyr_[_maxEthPID].win);
        // pay for maxAff player
        plyr_[_maxAffPID].win = _maxAff.add(plyr_[_maxAffPID].win);
        //deal multi winner, no.1 last, no.2 last, no.3 last...
        for(uint256 _seq=0; _seq<potToWinners_.length; _seq++){
            uint256 _win = _pot.mul(potToWinners_[_seq]) / 100;
            uint256 _winPID = round_[_rID].plyrs[_seq];
            if(0 == _winPID){
               // invalid pid, set default pid:1
               _winPID = 1;
            }
            // pay our winner
            plyr_[_winPID].win = _win.add(plyr_[_winPID].win);
            // count res eth
            _res = _res.sub(_win);
            // log it
            emit F3Devents.onRoundEnded1(
                _seq,
                _winPID,
                _win
            );
        }
        //log once
        emit F3Devents.onRoundEnded2(
            _maxEthPID,
            _maxEth,
            _maxAffPID,
            _maxAff
        );
        // prepare event data
        _eventData_.compressedData = _eventData_.compressedData + (round_[_rID].end * 1000000);
        _eventData_.compressedIDs = _eventData_.compressedIDs + (_winPID * 100000000000000000000000000) + (_winTID * 100000000000000000);
        _eventData_.winnerAddr = plyr_[_winPID].addr;
        _eventData_.winnerName = plyr_[_winPID].name;
        _eventData_.amountWon = _win;
        _eventData_.genAmount = 0;
        _eventData_.P3DAmount = 0;
        _eventData_.newPot = _res;
        // start next round
        rID_++;
        _rID++;
        round_[_rID].strt = now;
        round_[_rID].end = now.add(rndInit_).add(rndGap_);
        round_[_rID].pot = _res;
        return(_eventData_);
    }
}