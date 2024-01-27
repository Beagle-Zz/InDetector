contract c12674{
    /**
     * Calculate minimum needed house stake.
     */
    function minHouseStake(uint activeGames) public pure returns(uint) {
        return  MathUtil.min(activeGames, 1) * MAX_BET_VALUE * 400;
    }
}