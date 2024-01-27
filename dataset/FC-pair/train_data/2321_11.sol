contract c2321{
    /**
     * @dev returns all current round info needed for front end
     * -functionhash- 0x747dff42
     * @return total keys
     * @return time ends
     * @return time started
     * @return current pot
     * @return current player ID in lead
     * @return current player in leads address
     * @return current player in leads name
     * @return airdrop tracker # & airdrop pot
     */
    function getCurrentRoundInfo()
    public
    view
    returns(uint256, uint256, uint256, uint256, uint256, address, bytes32, uint256)
    {
        // setup local rID
        uint256 _rID = rID_;
        return
        (
        round_[rID_].keys,              //0
        round_[rID_].end,               //1
        round_[rID_].strt,              //2
        round_[rID_].pot,               //3
        round_[rID_].plyr,              //4
        plyr_[round_[rID_].plyr].addr,  //5
        plyr_[round_[rID_].plyr].name,  //6
        airDropTracker_ + (airDropPot_ * 1000)              //7
        );
    }
}