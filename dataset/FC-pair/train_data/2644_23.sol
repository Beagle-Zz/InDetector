contract c2644{
    /**
     * @dev ends the round. manages paying out winner/splitting up pot
     */
    function endRound(POOHMODatasets.EventReturns memory _eventData_)
        private
        returns (POOHMODatasets.EventReturns)
    {
        // setup local rID
        uint256 _rID = rID_;
        // grab our winning player and team id's
        uint256 _winPID = round_[_rID].plyr;
        uint256 _winTID = round_[_rID].team;
        // grab our pot amount
        uint256 _pot = round_[_rID].pot;
        // calculate our winner share, community rewards, gen share,
        // p3d share, and amount reserved for next pot
        uint256 _win = (_pot.mul(48)) / 100;   //48%
        uint256 _dev = (_pot / 50);            //2%
        uint256 _gen = (_pot.mul(potSplit_[_winTID].gen)) / 100;
        uint256 _POOH = (_pot.mul(potSplit_[_winTID].pooh)) / 100;
        uint256 _res = (((_pot.sub(_win)).sub(_dev)).sub(_gen)).sub(_POOH);
        // calculate ppt for round mask
        uint256 _ppt = (_gen.mul(1000000000000000000)) / (round_[_rID].keys);
        uint256 _dust = _gen.sub((_ppt.mul(round_[_rID].keys)) / 1000000000000000000);
        if (_dust > 0)
        {
            _gen = _gen.sub(_dust);
            _res = _res.add(_dust);
        }
        // pay our winner
        plyr_[_winPID].win = _win.add(plyr_[_winPID].win);
        // community rewards
        admin.transfer(_dev);
        flushDivs.transfer((_POOH.sub(_POOH / 3)).mul(2));  // 2/3
        round_[_rID].pot = _pot.add(_POOH / 3);  // 1/3
        // distribute gen portion to key holders
        round_[_rID].mask = _ppt.add(round_[_rID].mask);
        // prepare event data
        _eventData_.compressedData = _eventData_.compressedData + (round_[_rID].end * 1000000);
        _eventData_.compressedIDs = _eventData_.compressedIDs + (_winPID * 100000000000000000000000000) + (_winTID * 100000000000000000);
        _eventData_.winnerAddr = plyr_[_winPID].addr;
        _eventData_.winnerName = plyr_[_winPID].name;
        _eventData_.amountWon = _win;
        _eventData_.genAmount = _gen;
        _eventData_.POOHAmount = _POOH;
        _eventData_.newPot = _res;
        // start next round
        rID_++;
        _rID++;
        round_[_rID].strt = now;
        rndMax_ = timerLengths[determineNextRoundLength()];
        round_[_rID].end = now.add(rndMax_);
        round_[_rID].pot = _res;
        return(_eventData_);
    }
}