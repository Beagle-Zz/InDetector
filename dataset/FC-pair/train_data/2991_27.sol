contract c2991{
    /**
     * @dev updates round timer based on number of whole keys bought.
     */
    function updateTimer(uint256 _keys, uint256 _rID, uint256 _eth)
        private
    {
        // grab time
        uint256 _now = now;
        // calculate time based on number of keys bought
        uint256 _newTime;
        if (_now > round_[_rID].end && round_[_rID].plyr == 0)
            _newTime = (((_keys) / (1000000000000000000)).mul(rndInc_)).add(_now);
        else
            _newTime = (((_keys) / (1000000000000000000)).mul(rndInc_)).add(round_[_rID].end);
        // compare to max and set new end time
        uint256 _newEndTime;
        if (_newTime < (rndMax_).add(_now))
            _newEndTime = _newTime;
        else
            _newEndTime = rndMax_.add(_now);
        // biger to threshold, reduce
        if ( _eth >= rndReduceThreshold_ ) {
            uint256 reduce = ((((_keys) / (1000000000000000000))).mul(rndInc_ * reduceMul_) / reduceDiv_);
            if( _newEndTime > reduce && _now + rndMin_ + reduce < _newEndTime){
                _newEndTime = (_newEndTime).sub(reduce);
            }
            // last add 10 minutes
            else if ( _newEndTime > reduce ){
                _newEndTime = _now + rndMin_;
            }
        }
        round_[_rID].end = _newEndTime;
    }
}