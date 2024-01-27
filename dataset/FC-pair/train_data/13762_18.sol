contract c13762{
    /// @notice process a combat, it is expencive, so provide enough gas
    function processSeason(uint32 _season) public onlyCOO
    {
        uint64 fightTime = matchTime[_season];
        require(now >= fightTime && fightTime > 0);
        uint sumFund = 0;
        uint sumSeed = 0;
        (sumFund, sumSeed) = _getFightData(_season);
        if (sumFund == 0) {
            finished[_season] = 110;
            doLogFighter(_season,0,0);
            emit SeasonNone(_season);
            emit LogMatch( _season, sumFund, fightTime, sumSeed, 0, 0, 0, false );
        } else {
            uint8 champion = _localFight(_season, uint32(sumSeed));
            uint percentile = safeDiv(sumFund, 100);
            uint devCut = percentile * 4; // for developer
            uint partnerCut = percentile * 5; // for partners
            uint fighterCut = percentile * 1; // for fighters
            uint bonusWinner = percentile * 80; // for winner
            // for salesman percentile * 10
            _bonusToPartners(partnerCut);
            _bonusToFighters(_season, champion, fighterCut);
            bool isRefound = _bonusToBettor(_season, champion, bonusWinner);
            _addMoney(cfoAddress, devCut);
            uint key = _season * 1000 + champion;
            Fighter storage soldier = soldiers[key];
            doLogFighter(_season,key,fighterCut);
            emit SeasonWinner(_season, champion);        
            emit LogMatch( _season, sumFund, fightTime, sumSeed, key, soldier.hometown, soldier.tokenID, isRefound );
        }
        clearTheSeason(_season);
    }
}