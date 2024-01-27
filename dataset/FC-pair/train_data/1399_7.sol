contract c1399{
//==============================================================================
//     _  _ _|__|_ _  _ _  .
//    (_|(/_ |  | (/_| _\  . (for UI & viewing things on etherscan)
//=====_|=======================================================================
    /**
     * @dev return the price buyer will pay for next 1 individual key.
     * -functionhash- 0x018a25e8
     * @return price for next key bought (in wei format)
     */
    function getBuyPrice()
        public 
        view 
        returns(uint256)
    {
        uint256 _rID = rID_;          
        // grab time
        uint256 _now = now;
        // are we in a round?
        if (_now > round[_rID].strt + rndGap_ && (_now <= round[_rID].end || (_now > round[_rID].end && round[_rID].plyr == 0)))
            return ( (round[_rID].keys.add(1000000000000000000)).ethRec(1000000000000000000) );
        else // rounds over.  need price for new round
            return ( 75000000000000 ); // init
    }
}