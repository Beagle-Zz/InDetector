contract c2761{
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
        returns(uint256, uint256, uint256, uint256, uint256, uint256, uint256, address, bytes32, uint256, uint256, uint256, uint256, uint256)
    {
        // setup local rID
        // uint256 _rID = rID_;
        return
        (
            round_[rID_].ico,               //0
            rID_,                           //1
            round_[rID_].keys,              //2
            round_[rID_].end,               //3
            round_[rID_].strt,              //4
            round_[rID_].pot,               //5
            (round_[rID_].team + (round_[rID_].plyrs[winnerNum_ - 1] * 10)),     //6
            plyr_[round_[rID_].plyrs[winnerNum_ - 1]].addr,  //7
            plyr_[round_[rID_].plyrs[winnerNum_ - 1]].name,  //8
            rndTmEth_[rID_][0],             //9
            rndTmEth_[rID_][1],             //10
            rndTmEth_[rID_][2],             //11
            rndTmEth_[rID_][3],             //12
            airDropTracker_ + (airDropPot_ * 1000)              //13
        );
    }
}