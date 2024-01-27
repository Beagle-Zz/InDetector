contract c2954{
    /** 
     * @dev returns current eth price for X keys.  
     * -functionhash- 0xcf808000
     * @param _keys number of keys desired (in 18 decimal format)
     * @return amount of eth needed to send
     */
    function iWantXKeys(uint256 _keys)
        public
        view
        returns(uint256)
    {
        // grab time
        uint256 _now = now;
        // are we in a round?
        if (_now > round_.strt + rndGap_ && (_now <= round_.end || (_now > round_.end && round_.plyr == 0)))
            return ( (round_.keys.add(_keys)).ethRec(_keys) );
        else // rounds over.  need price for new round
            return ( (_keys).eth() );
    }
}