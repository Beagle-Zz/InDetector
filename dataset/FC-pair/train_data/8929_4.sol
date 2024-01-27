contract c8929{
    /**
     * Setup array with vesting stages dates and percents.
     */
    function initVestingStages () internal {
        uint256 halfOfYear = 183 days;
        uint256 year = halfOfYear * 2;
        stages[0].date = vestingStartTimestamp;
        stages[1].date = vestingStartTimestamp + halfOfYear;
        stages[2].date = vestingStartTimestamp + year;
        stages[3].date = vestingStartTimestamp + year + halfOfYear;
        stages[4].date = vestingStartTimestamp + year * 2;
        stages[0].tokensUnlockedPercentage = 25;
        stages[1].tokensUnlockedPercentage = 50;
        stages[2].tokensUnlockedPercentage = 75;
        stages[3].tokensUnlockedPercentage = 88;
        stages[4].tokensUnlockedPercentage = 100;
    }
}