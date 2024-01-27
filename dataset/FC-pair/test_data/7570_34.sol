contract c7570{
    /**
    * @dev Release tokens to multiple addresses.
    * @param contributors Addresses to release tokens to
    */
    function releaseTokens(address[] contributors) external onlyOwner {
        for (uint256 j = 0; j < contributors.length; j++) {
            // the amount of tokens to be distributed to contributor
            uint256 tokensAmount = depositedTokens[contributors[j]];
            if (tokensAmount > 0) {
                super._deliverTokens(contributors[j], tokensAmount);
                depositedTokens[contributors[j]] = 0;
                //update state of release
                tokensReleasedAmount = tokensReleasedAmount.add(tokensAmount);
            }
        }
    }
}