contract c2789{
    /**
     * @dev returns all current round info needed for front end
     * 0x747dff42
     * @return round id 
     * @return total eth for round
     * @return total keys for round 
     * @return time round started
     * @return time round ends
     * @return current leader
     * @return lastest price
     * @return current key price
     */
    function getCurrentRoundInfo()
        public 
        view 
        returns(uint256, uint256, uint256, uint256, uint256, address, uint256, uint256)
    {
        uint256 _rndNo = rndNo;
        return (
            _rndNo,
            round_m[_rndNo].eth,
            round_m[_rndNo].keys,
            round_m[_rndNo].startTime,
            round_m[_rndNo].endTime,
            round_m[_rndNo].leader,
            round_m[_rndNo].lastPrice,
            getBuyPrice()
        );
    }
}