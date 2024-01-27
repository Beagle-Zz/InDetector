contract c2995{
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
        // grab time
        uint256 _now = now;
        if (_now < round_.end)
            if (_now > round_.strt + rndGap_)
                return( (round_.end).sub(_now) );
            else
                return( (round_.strt + rndGap_).sub(_now));
        else
            return(0);
    }
}