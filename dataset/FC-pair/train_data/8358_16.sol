contract c8358{
    /**
     * @dev Get the amount of vested tokens at a specific time.
     * @param grant TokenGrant The grant to be checked.
     * @param time The time to be checked
     * @return An uint representing the amount of vested tokens of a specific grant at a specific time.
     */
    function vestedTokens(TokenGrant grant, uint time, uint number) private pure returns (uint256) {
        return calculateVestedTokens(
            grant.timeOrNumber,
            grant.value,
            uint256(time),
            uint256(number),
            uint256(grant.start),
            uint256(grant.cliff),
            uint256(grant.vesting)
        );
    }
}