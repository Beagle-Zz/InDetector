contract c7214{
    /// @dev Burn state for a pricefeed operator
    /// @param user Address of pricefeed operator to burn the stake from
    function burnStake(address user)
        external
        auth
    {
        uint totalToBurn = add(stakedAmounts[user], stakeToWithdraw[user]);
        stakedAmounts[user] = 0;
        stakeToWithdraw[user] = 0;
        updateStakerRanking(user);
        emit StakeBurned(user, totalToBurn, "");
    }
}