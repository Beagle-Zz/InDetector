contract c2954{
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
     * @return airdrop tracker
     * @return airdrop pot
     */
    function getCurrentRoundInfo()
        public
        view
        returns(uint256, uint256, uint256, uint256, uint256, address, bytes32, uint256, uint256)
    {
        return
        (
            round_.keys,              //0
            round_.end,               //1
            round_.strt,              //2
            round_.pot,               //3
            round_.plyr,              //4
            plyr_[round_.plyr].addr,  //5
            plyr_[round_.plyr].name,  //6
            airDropTracker_,          //7
            airDropPot_               //8
        );
    }
}