contract c13762{
    /// @dev get base infomation of the seasons
    function getSeasonInfo(uint32[99] _seasons) view public returns (uint length,uint[99] matchTimes, uint[99] results) {
        for (uint i = 0; i < _seasons.length; i++) {    
            uint32 _season = _seasons[i];
            if(_season >0){
                matchTimes[i] = matchTime[_season];
                results[i] = finished[_season];
            }else{
                length = i;
                break;
            }
        }
    }
}