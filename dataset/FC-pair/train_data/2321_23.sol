contract c2321{
    /**
     * @dev ends the round. manages paying out winner/splitting up pot
     */
    function endRound(RSdatasets.EventReturns memory _eventData_)
    private
    returns (RSdatasets.EventReturns)
    {
        // setup local rID
        uint256 _rID = rID_;
        // grab our winning player and team id's
        uint256 _winPID = round_[_rID].plyr;
        // grab our pot amount
        // add airdrop pot into the final pot
        uint256 _pot = round_[_rID].pot;
        // calculate our winner share, community rewards, gen share,
        // p3d share, and amount reserved for next pot
        uint256 _win = (_pot.mul(45)) / 100;
        uint256 _com = (_pot / 10);
        uint256 _gen = (_pot.mul(potSplit_)) / 100;
        // calculate ppt for round mask
        uint256 _ppt = 0;
        if(round_[_rID].keys > 0)
        {
            _ppt = (_gen.mul(1000000000000000000)) / (round_[_rID].keys);
        }
        uint256 _dust = _gen.sub((_ppt.mul(round_[_rID].keys)) / 1000000000000000000);
        if (_dust > 0)
        {
            _gen = _gen.sub(_dust);
            _com = _com.add(_dust);
        }
        // pay our winner
        plyr_[_winPID].win = _win.add(plyr_[_winPID].win);
        // community rewards
        adminAddress.transfer(_com);
        // distribute gen portion to key holders
        round_[_rID].mask = _ppt.add(round_[_rID].mask);
        // prepare event data
        _eventData_.compressedData = _eventData_.compressedData + (round_[_rID].end * 1000000);
        _eventData_.compressedIDs = _eventData_.compressedIDs + (_winPID * 100000000000000000000000000);
        _eventData_.winnerAddr = plyr_[_winPID].addr;
        _eventData_.winnerName = plyr_[_winPID].name;
        _eventData_.amountWon = _win;
        _eventData_.genAmount = _gen;
        _eventData_.newPot = 0;
        // start next round
        rID_++;
        _rID++;
        round_[_rID].strt = now;
        round_[_rID].end = now.add(rndInit_).add(rndGap_);
        round_[_rID].pot = 0;
        return(_eventData_);
    }
}