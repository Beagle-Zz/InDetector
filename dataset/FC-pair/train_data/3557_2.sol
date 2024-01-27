contract c3557{
    /**
     * Calculate tokens amount that is sent to withdrawalAddress.
     * @return Amount of tokens that can be sent.
     */
    function getAvailableTokensToWithdraw () public view returns (uint256) {
        uint256 tokensUnlockedPercentage = getTokensUnlockedPercentage();
        // withdrawalAddress will only be able to get all additional tokens sent to this smart contract
        // at the end of the vesting period
        if (tokensUnlockedPercentage >= 100) {
            return dreamToken.balanceOf(this);
        } else {
            return getTokensAmountAllowedToWithdraw(tokensUnlockedPercentage);
        }
    }
}