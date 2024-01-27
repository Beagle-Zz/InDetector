contract c2662{
    /**
     * @dev Get the amount of vested tokens at a specific time.
     * @param grant TokenGrant The grant to be checked.
     * @param time The time to be checked
     * @return An uint256 representing the amount of vested tokens of a specific grant at a specific time.
     */
    function vestedTokens(TokenGrant grant, uint64 time) private constant returns (uint256) {
        return calculateVestedTokens(
            grant.value,
            uint256(time),
            uint256(grant.start),
            uint256(grant.cliff),
            uint256(grant.vesting)
        );
    }
}