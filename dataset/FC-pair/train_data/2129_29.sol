contract c2129{
    /**
     * @dev calc real max time for spent time. maxtime make half per day
     */
    function getRealRndMaxTime(uint256 _rID)
        public
        returns(uint256)
    {
        uint256 _realRndMax = rndMax_;
        uint256 _days = (now - round_[_rID].strt) / (1 days);
        while(0 < _days --){
            _realRndMax = _realRndMax / 2;
        }
        return (_realRndMax > 10 minutes) ? _realRndMax : 10 minutes;
    }
}