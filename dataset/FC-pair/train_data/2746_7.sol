contract c2746{
//==============================================================================
//     _  _ _|__|_ _  _ _  .
//    (_|(/_ |  | (/_| _\  . (for UI & viewing things on etherscan)
//=====_|=======================================================================
    /**
     * @dev return the price buyer will pay for next 1 individual key.
     * - during live round.  this is accurate. (well... unless someone buys before 
     * you do and ups the price!  you better HURRY!)
     * - during ICO phase.  this is the max you would get based on current eth 
     * invested during ICO phase.  if others invest after you, you will receive
     * less.  (so distract them with meme vids till ICO is over)
     * -functionhash- 0x018a25e8
     * @return price for next key bought (in wei format)
     */
    function getBuyPrice()
        public 
        view 
        returns(uint256)
    {  
        // setup local rID
        uint256 _rID = rID_;
        // grab time
        uint256 _now = now;
        // is ICO phase over??  & theres eth in the round?
        if (_now > round_[_rID].strt + rndGap_ && round_[_rID].eth != 0 && _now <= round_[_rID].end)
            return ( (round_[_rID].keys.add(1000000000000000000)).ethRec(1000000000000000000) );
        else if (_now <= round_[_rID].end) // round hasn't ended (in ICO phase, or ICO phase is over, but round eth is 0)
            return ( ((round_[_rID].ico.keys()).add(1000000000000000000)).ethRec(1000000000000000000) );
        else // rounds over.  need price for new round
            return ( 100000000000000 ); // init
    }
}