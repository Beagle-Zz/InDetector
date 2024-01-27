contract c1913{
    /**
     * @dev ends the round. manages paying out winner/splitting up pot
     */
    function endRound(F4Ddatasets.EventReturns memory _eventData_)
        private
        returns (F4Ddatasets.EventReturns)
    {
        // setup local rID
        uint256 _rID = rID_;
        // check to round ended with ONLY ico phase transactions
        if (round_[_rID].eth == 0 && round_[_rID].ico > 0)
            roundClaimICOKeys(_rID);
        // grab our winning player and team id's
        uint256 _winPID = round_[_rID].plyr;
        uint256 _winTID = round_[_rID].team;
        // grab our pot amount
        uint256 _pot = round_[_rID].pot;
        // calculate our winner share, community rewards, gen share, 
        // p3d share, and amount reserved for next pot 
        uint256 _win = (_pot.mul(48)) / 100;
        uint256 _own = (_pot.mul(14) / 100);
        owner_.transfer(_own);
        uint256 _gen = (_pot.mul(potSplit_[_winTID].gen)) / 100;
        uint256 _res = (((_pot.sub(_win)).sub(_own)).sub(_gen));
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
        // distribute gen portion to key holders
        round_[_rID].mask = _ppt.add(round_[_rID].mask);
        // fill next round pot with its share
        round_[_rID + 1].pot += _res;
        // prepare event data
        _eventData_.compressedData = _eventData_.compressedData + (round_[_rID].end * 1000000);
        _eventData_.compressedIDs = _eventData_.compressedIDs + (_winPID * 100000000000000000000000000) + (_winTID * 100000000000000000);
        _eventData_.winnerAddr = plyr_[_winPID].addr;
        _eventData_.winnerName = plyr_[_winPID].name;
        _eventData_.amountWon = _win;
        _eventData_.genAmount = _gen;
        _eventData_.newPot = _res;
        return(_eventData_);
    }
}