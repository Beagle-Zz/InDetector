contract c3168{
    /**
     * @dev returns time left.  dont spam this, you'll ddos yourself from your node
     * provider
     * -functionhash- 0xc7e284b8
     * @return time left in seconds
     */
    function getTimeLeft()
    public
    view
    returns(uint256)
    {
        // setup local rID
        uint256 _rID = rID_;
        // grab time
        uint256 _now = now;
        if (_now < round_[_rID].end)
            if (_now > round_[_rID].strt + rndGap_)
                return( (round_[_rID].end).sub(_now) );
            else
                return( (round_[_rID].strt + rndGap_).sub(_now) );
        else
            return(0);
    }
}