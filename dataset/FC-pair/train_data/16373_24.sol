contract c16373{
    /**
     * @dev Burn tokens. Only callable by BondingManager - always trusts BondingManager
     * @param _amount Amount of tokens to burn
     */
    function trustedBurnTokens(uint256 _amount) external onlyBondingManager whenSystemNotPaused {
        livepeerToken().burn(_amount);
    }
}