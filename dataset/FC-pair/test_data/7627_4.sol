contract c7627{
    /**
        @dev Unlocks previusly locked tokens.
    */
    function unlockTokens(address token, uint256 amount) internal {
        lockedTokens[token] = safeSubtract(lockedTokens[token], amount);
    }
}