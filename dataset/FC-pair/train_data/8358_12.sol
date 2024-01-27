contract c8358{
    /**
     * @dev Calculate the total amount of transferable tokens of a holder at a given time
     * @param holder address The address of the holder
     * @param time uint The specific time.
     * @return An uint representing a holder&#39;s total amount of transferable tokens.
     */
    function transferableTokens(address holder, uint time, uint number) view public returns (uint256) {
        uint256 grantIndex = tokenGrantsCount(holder);
        if (grantIndex == 0) return balanceOf(holder); // shortcut for holder without grants
        // Iterate through all the grants the holder has, and add all non-vested tokens
        uint256 nonVested = 0;
        for (uint256 i = 0; i < grantIndex; i++) {
            nonVested = SafeMath.add(nonVested, nonVestedTokens(grants[holder][i], time, number));
        }
        // Balance - totalNonVested is the amount of tokens a holder can transfer at any given time
        uint256 vestedTransferable = SafeMath.sub(balanceOf(holder), nonVested);
        // Return the minimum of how many vested can transfer and other value
        // in case there are other limiting transferability factors (default is balanceOf)
        return SafeMath.min256(vestedTransferable, super.transferableTokens(holder, time, number));
    }
}