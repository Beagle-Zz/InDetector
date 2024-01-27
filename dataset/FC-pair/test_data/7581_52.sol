contract c7581{
    /**
     * @notice Destroy the vesting information associated with an account.
     */
    function purgeAccount(address account)
        external
        onlyOwner
        onlyDuringSetup
    {
        delete vestingSchedules[account];
        totalVestedBalance = safeSub(totalVestedBalance, totalVestedAccountBalance[account]);
        delete totalVestedAccountBalance[account];
    }
}