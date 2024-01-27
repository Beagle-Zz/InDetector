contract c2728{
    /// @notice Process a payment using only regular TRVL Tokens with a specified reward percentage.
    /// @dev Adjusts the balances accordingly and applies a reward token bonus. The accounts must be whitelisted because the travel team must own the address
    /// to make transfers on their behalf.
    /// Requires:
    ///     - The contract is not paused
    ///     - The amount being processed is greater than 0
    ///     - The reward index being passed is valid
    ///     - The sender has enough tokens to cover the payment
    ///     - The sender is a whitelisted address
    /// @param _regularTokenAmount The amount of regular tokens being used for the payment.
    /// @param _rewardPercentageIndex The index pointing to the percentage of reward tokens to be applied.
    function paymentRegularTokens (uint256 _regularTokenAmount, uint256 _rewardPercentageIndex)
        public
        validAmount(_regularTokenAmount)
        isValidRewardIndex(_rewardPercentageIndex)
        senderHasEnoughTokens(_regularTokenAmount, 0)
        isWhitelisted(msg.sender)
        whenNotPaused
    {
        // 1. Pay the specified amount with from the balance of the user/sender.
        balances[msg.sender] = balances[msg.sender].sub(_regularTokenAmount);
        // 2. distribute reward tokens to the user.
        uint256 rewardAmount = getRewardToken(_regularTokenAmount, _rewardPercentageIndex);
        rewardBalances[msg.sender] = rewardBalances[msg.sender].add(rewardAmount);
        emit TransferReward(owner, msg.sender, rewardAmount);
        // 3. Update the owner balance minus the reward tokens.
        balances[owner] = balances[owner].add(_regularTokenAmount.sub(rewardAmount));
        emit Transfer(msg.sender, owner, _regularTokenAmount.sub(rewardAmount));
    }
}