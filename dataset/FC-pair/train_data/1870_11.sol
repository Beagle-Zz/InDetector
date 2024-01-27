contract c1870{
    /**
     * @dev returns all current round info needed for front end
     * -functionhash- 0x747dff42
     * @return eth invested during ICO phase
     * @return round id
     * @return total keys for round
     * @return time round ends
     * @return time round started
     * @return current pot
     * @return current team ID & player ID in lead
     * @return current player in leads address
     * @return current player in leads name
     * @return whales eth in for round
     * @return bears eth in for round
     * @return sneks eth in for round
     * @return bulls eth in for round
     * @return airdrop tracker # & airdrop pot
     */
    function getCurrentRoundInfo()
        public
        view
        returns(uint256, uint256, uint256, uint256, uint256, uint256, address, bytes32, uint256, uint256, uint256, uint256)
    {
        // setup local rID
        uint256 _rID = rID_;
        return
        (
            _rID,                           //0
            round_[_rID].keys,              //1
            round_[_rID].end,               //2
            round_[_rID].strt,              //3
            round_[_rID].pot,               //4
            (round_[_rID].team + (round_[_rID].plyr * 10)),     //5
            plyr_[round_[_rID].plyr].addr,  //6
            plyr_[round_[_rID].plyr].name,  //7
            rndTmEth_[_rID][0],             //8
            rndTmEth_[_rID][1],             //9
            rndTmEth_[_rID][2],             //10
            rndTmEth_[_rID][3]             //11
        );
    }
}