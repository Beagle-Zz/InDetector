contract c3113{
    /**
     * @dev returns the amount of keys you would get given an amount of eth.
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
        // are we in a round?
        if (_now > round_[_rID].strt + rndGap_ && (_now <= round_[_rID].end || (_now > round_[_rID].end && round_[_rID].plyr == 0)))
            return ( (round_[_rID].eth).keysRec(_eth) );
        else // rounds over.  need keys for new round
            return ( (_eth).keys() );
    }
}