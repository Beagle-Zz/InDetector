contract c8358{
    /**
     * @dev Calculate the amount of non vested tokens at a specific time.
     * @param grant TokenGrant The grant to be checked.
     * @param time uint64 The time to be checked
     * @return An uint representing the amount of non vested tokens of a specifc grant on the 
     * passed time frame.
     */
    function nonVestedTokens(TokenGrant grant, uint time, uint number) private pure returns (uint256) {
        return grant.value.sub(vestedTokens(grant, time, number));
    }
}