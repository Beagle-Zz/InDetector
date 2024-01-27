contract c13762{
    /// @dev write log about 8 fighters
    function doLogFighter( uint32 _season, uint _winnerKey, uint fighterReward) internal {
        for (uint i = 0; i < 8; i++){
            uint key = _season * 1000 + i;
            uint8 isWin = 0;
            uint64 fightTime = matchTime[_season];
            uint winMoney = safeDiv(fighterReward, 10);
            if(key == _winnerKey){
                isWin = 1;
                winMoney = safeMul(winMoney, 3);
            }
            Fighter storage soldier = soldiers[key];
            emit LogFighter( _season, soldier.owner, key, betOnFighter[key], soldier.hometown, soldier.tokenID, soldier.power, isWin,winMoney,fightTime);
        }
    }
}