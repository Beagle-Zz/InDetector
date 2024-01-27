contract c13762{
    /// @dev process a fight
    function _localFight(uint32 _season, uint32 _seed) internal returns (uint8 winner)
    {
        require(finished[_season] == 0);//make sure a season just match once.
        uint[] memory powers = new uint[](8);
        uint sumPower = 0;
        uint8 i = 0;
        uint key = 0;
        Fighter storage soldier = soldiers[0];
        for (i = 0; i < 8; i++) {
            key = _season * 1000 + i;
            soldier = soldiers[key];
            powers[i] = soldier.power;
            sumPower = sumPower + soldier.power;
        }
        uint sumValue = 0;
        uint tmpPower = 0;
        for (i = 0; i < 8; i++) {
            tmpPower = powers[i] ** 5;//
            sumValue += tmpPower;
            powers[i] = sumValue;
        }
        uint singleDeno = sumPower ** 5;
        uint randomVal = _getRandom(_seed);
        winner = 0;
        uint shoot = sumValue * randomVal * 10000000000 / singleDeno / 0xffffffff;
        for (i = 0; i < 8; i++) {
            tmpPower = powers[i];
            if (shoot <= tmpPower * 10000000000 / singleDeno) {
                winner = i;
                break;
            }
        }
        finished[_season] = uint8(100 + winner);
        return winner;
    }
}