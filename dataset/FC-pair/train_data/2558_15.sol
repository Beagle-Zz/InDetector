contract c2558{
    /// @dev stake function reduces the user's total available balance and adds it to their staking balance
    /// @param _value how many tokens a user wants to stake
    function stake(address _user, uint256 _value) private returns (bool success) {
        // You can only stake as many tokens as you have
        require(_value <= balances[_user]);
        // You can only stake tokens if you have not already staked tokens
        require(stakeBalances[_user].stakeBalance == 0);
        // Subtract stake amount from regular token balance
        balances[_user] = balances[_user].sub(_value);
        // Add stake amount to staked balance
        stakeBalances[_user].stakeBalance = _value;
        // Increment the staking staked tokens value
        totalScaleStaked = totalScaleStaked.add(_value);
        // Save the time that the stake started
        stakeBalances[_user].initialStakeTime = now.div(timingVariable);
        // Set the new staking history
        setTotalStakingHistory();
        // Fire an event to tell the world of the newly staked tokens
        emit Stake(_user, _value);
        return true;
    }
}