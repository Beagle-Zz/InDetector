contract c13762{
    /// @dev set a fighter for a season, prepare for combat.
    function createSeason(uint32 _season, uint64 fightTime, uint64 _seedFromCOO, address[8] _home, uint[8] _tokenID, uint16[8] _power, address[8] _owner) external onlyCOO {
        require(matchTime[_season] <= 0);
        require(fightTime > 0);
        require(_seedFromCOO > 0);
        seasonIDs.push(_season);// a new season
        matchTime[_season] = fightTime;
        seedFromCOO[_season] = _seedFromCOO;
        for (uint i = 0; i < 8; i++) {        
            Fighter memory soldier = Fighter({
                hometown:_home[i],
                owner:_owner[i],
                tokenID:_tokenID[i],
                power: _power[i]
            });
            uint key = _season * 1000 + i;
            soldiers[key] = soldier;
        }
        //fire the event
        emit FighterReady(_season);
    }
}