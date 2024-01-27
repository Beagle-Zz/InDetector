contract c2166{
    /**
     * @dev Calculate the total amount of transferable tokens of a holder at a given time
     * @param holder address The address of the holder
     * @param time uint64 The specific time.
     * @return An uint256 representing a holder's total amount of transferable tokens.
     */
    function transferableTokens(address holder, uint64 time) public constant returns (uint256) {
        uint256 grantIndex = tokenGrantsCount(holder);
        if (grantIndex == 0) return super.transferableTokens(holder, time); // shortcut for holder without grants
        // Iterate through all the grants the holder has, and add all non-vested tokens
        uint256 nonVested = 0;
        for (uint256 i = 0; i < grantIndex; i++) {
            nonVested = SafeMath.add(nonVested, nonVestedTokens(grants[holder][i], time));
        }
        // Balance - totalNonVested is the amount of tokens a holder can transfer at any given time
        uint256 vestedTransferable = SafeMath.sub(balanceOf(holder), nonVested);
        // Return the minimum of how many vested can transfer and other value
        // in case there are other limiting transferability factors (default is balanceOf)
        return Math.min256(vestedTransferable, super.transferableTokens(holder, time));
    }
}