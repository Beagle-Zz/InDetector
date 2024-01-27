contract c2199{
    /**
     * @dev during ICO phase all eth sent in by each player.  will be added to an 
     * "investment pool".  upon end of ICO phase, all eth will be used to buy keys.
     * each player receives an amount based on how much they put in, and the 
     * the average price attained.
     */
    function icoPhaseCore(uint256 _pID, uint256 _eth, uint256 _team, uint256 _affID, F3Ddatasets.EventReturns memory _eventData_)
        private
    {
        // setup local rID
        uint256 _rID = rID_;
        // if they bought at least 1 whole key (at time of purchase)
        if ((round_[_rID].ico).keysRec(_eth) >= 1000000000000000000 || round_[_rID].plyr == 0)
        {
            // set new leaders
            if (round_[_rID].plyr != _pID)
                round_[_rID].plyr = _pID;  
            if (round_[_rID].team != _team)
                round_[_rID].team = _team;
            // set the new leader bool to true
            _eventData_.compressedData = _eventData_.compressedData + 100;
        }
        // add eth to our players & rounds ICO phase investment. this will be used 
        // to determine total keys and each players share 
        plyrRnds_[_pID][_rID].ico = _eth.add(plyrRnds_[_pID][_rID].ico);
        round_[_rID].ico = _eth.add(round_[_rID].ico);
        // add eth in to team eth tracker
        rndTmEth_[_rID][_team] = _eth.add(rndTmEth_[_rID][_team]);
        // send eth share to com, p3d, affiliate, and fomo3d long
        _eventData_ = distributeExternal(_rID, _pID, _eth, _affID, _team, _eventData_);
        // calculate gen share 
        uint256 _gen = (_eth.mul(fees_[_team].gen)) / 100;
        // add gen share to rounds ICO phase gen tracker (will be distributed 
        // when round starts)
        round_[_rID].icoGen = _gen.add(round_[_rID].icoGen);
		// toss 1% into airdrop pot 
        uint256 _air = (_eth / 100);
        airDropPot_ = airDropPot_.add(_air);
        // calculate pot share pot (eth = eth - (com share + pot swap share + aff share + p3d share + airdrop pot share)) - gen
        uint256 _pot = (_eth.sub(((_eth.mul(14)) / 100).add((_eth.mul(fees_[_team].p3d)) / 100))).sub(_gen);
        // add eth to pot
        round_[_rID].pot = _pot.add(round_[_rID].pot);
        // set up event data
        _eventData_.genAmount = _gen.add(_eventData_.genAmount);
        _eventData_.potAmount = _pot;
        // fire event
        endTx(_rID, _pID, _team, _eth, 0, _eventData_);
    }
}