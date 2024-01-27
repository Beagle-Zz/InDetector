contract c2558{
    /// @dev allows users to reclaim any staked tokens
    /// @return bool on success
    function unstake() external returns (bool) {
        // Require that there was some amount vested
        require(stakeBalances[msg.sender].stakeBalance > 0);
        // Require that at least 7 timing variables have passed (days)
        require(now.div(timingVariable).sub(stakeBalances[msg.sender].initialStakeTime) >= 7);
        // Calculate tokens to mint
        uint _tokensToMint = calculateStakeGains(now);
        balances[msg.sender] = balances[msg.sender].add(stakeBalances[msg.sender].stakeBalance);
        // Subtract stake balance from totalScaleStaked
        totalScaleStaked = totalScaleStaked.sub(stakeBalances[msg.sender].stakeBalance);
        // Mint the new tokens to the sender
        mint(msg.sender, _tokensToMint);
        // Scale unstaked event
        emit Unstake(msg.sender, stakeBalances[msg.sender].stakeBalance, _tokensToMint);
        // Clear out stored data from mapping
        stakeBalances[msg.sender].stakeBalance = 0;
        stakeBalances[msg.sender].initialStakeTime = 0;
        // Set this every time someone adjusts the totalScaleStaking amount
        setTotalStakingHistory();
        return true;
    }
}