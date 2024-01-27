contract c3048{
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
        // setup local rID
        uint256 _rID = rID_;
        return _keys.mul(round_[_rID].keyPrice);
    }
}