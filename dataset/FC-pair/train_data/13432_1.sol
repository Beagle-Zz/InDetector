contract c13432{
    /**
     * @notice Prevents the given wallet to transfer its token for the given duration.
     *      This methods resets the lock duration if one is already in place.
     * @param wallet The wallet address to lock
     * @param duration How much time is the token locked from now (in sec)
     */
    function lockup(
        address wallet,
        uint256 duration
    )
        public onlyOwner
    {
        uint256 lockupExpiration = duration.add(now);
        lockupExpirations[wallet] = lockupExpiration;
        emit LockupApplied(wallet, lockupExpiration);
    }
}