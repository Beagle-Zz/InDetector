contract c2199{
    /** 
     * @dev returns current eth price for X keys.  
     * - during live round.  this is accurate. (well... unless someone buys before 
     * you do and ups the price!  you better HURRY!)
     * - during ICO phase.  this is the max you would get based on current eth 
     * invested during ICO phase.  if others invest after you, you will receive
     * less.  (so distract them with meme vids till ICO is over)
     * -functionhash- 0xcf808000
     * @param _keys number of keys desired (in 18 decimal format)
     * @return amount of eth needed to send
     */
    function iWantXKeys(uint256 _keys)
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
            return ( (round_[_rID].keys.add(_keys)).ethRec(_keys) );
        else if (_now <= round_[_rID].end) // round hasn't ended (in ICO phase, or ICO phase is over, but round eth is 0)
            return ( (((round_[_rID].ico).keys()).add(_keys)).ethRec(_keys) );
        else // rounds over.  need price for new round
            return ( (_keys).eth() );
    }
}