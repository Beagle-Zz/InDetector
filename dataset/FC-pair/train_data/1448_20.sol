contract c1448{
    /** 
     * @dev returns the amount of keys you would get given an amount of eth. 
     * - during live round.  this is accurate. (well... unless someone buys before 
     * you do and ups the price!  you better HURRY!)
     * - during ICO phase.  this is the max you would get based on current eth 
     * invested during ICO phase.  if others invest after you, you will receive
     * less.  (so distract them with meme vids till ICO is over)
     * -functionhash- 0xce89c80c
     * @param _rID round ID you want price for
     * @param _eth amount of eth sent in 
     * @return keys received 
     */
    function calcKeysReceived(uint256 _rID, uint256 _eth)
        public
        view
        returns(uint256)
    {
        // grab time
        uint256 _now = now;
        // is ICO phase over??  & theres eth in the round?
        if (_now > round_[_rID].strt + rndGap_ && round_[_rID].eth != 0 && _now <= round_[_rID].end)
            return ( (round_[_rID].eth).keysRec(_eth) );
        else if (_now <= round_[_rID].end) // round hasn't ended (in ICO phase, or ICO phase is over, but round eth is 0)
            return ( (round_[_rID].ico).keysRec(_eth) );
        else // rounds over.  need keys for new round
            return ( (_eth).keys() );
    }
}