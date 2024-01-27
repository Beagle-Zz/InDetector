contract c8358{
    /**
     * @dev Calculate amount of vested tokens at a specifc time.
     * @param tokens uint256 The amount of tokens grantted.
     * @param time uint64 The time to be checked
     * @param start uint64 A time representing the begining of the grant
     * @param cliff uint64 The cliff period.
     * @param vesting uint64 The vesting period.
     * @return An uint representing the amount of vested tokensof a specif grant.
    *  transferableTokens
    *   |                         _/--------   vestedTokens rect
    *   |                       _/
    *   |                     _/
    *   |                   _/
    *   |                 _/
    *   |                /
    *   |              .|
    *   |            .  |
    *   |          .    |
    *   |        .      |
    *   |      .        |
    *   |    .          |
    *   +===+===========+---------+----------> time
    *      Start       Clift    Vesting
    */
    function calculateVestedTokensTime(
        uint256 tokens,
        uint256 time,
        uint256 start,
        uint256 cliff,
        uint256 vesting) public pure returns (uint256) {
        // Shortcuts for before cliff and after vesting cases.
        if (time < cliff) return 0;
        if (time >= vesting) return tokens;
        // Interpolate all vested tokens.
        // As before cliff the shortcut returns 0, we can use just calculate a value
        // in the vesting rect (as shown in above&#39;s figure)
        // vestedTokens = tokens * (time - start) / (vesting - start)
        uint256 vestedTokens = SafeMath.div(SafeMath.mul(tokens, SafeMath.sub(time, start)), SafeMath.sub(vesting, start));
        return vestedTokens;
    }
}