contract c8929{
    /**
     * Get detailed info about stage. 
     * Provides ability to get attributes of every stage from external callers, ie Web3, truffle tests, etc.
     *
     * @param index Vesting stage number. Ordered by ascending date and starting from zero.
     *
     * @return {
     *    "date": "Date of stage in unix timestamp format.",
     *    "tokensUnlockedPercentage": "Percent of tokens allowed to be withdrawn."
     * }
     */
    function getStageAttributes (uint8 index) public view returns (uint256 date, uint256 tokensUnlockedPercentage) {
        return (stages[index].date, stages[index].tokensUnlockedPercentage);
    }
}