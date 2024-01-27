contract c2728{
    /// @notice Process a payment using only reward TRVL Tokens.
    /// @dev Adjusts internal balances accordingly. The accounts must be whitelisted because the travel team must own the address
    /// to make transfers on their behalf.
    /// Requires:
    ///     - The contract is not paused
    ///     - The amount being processed is greater than 0
    ///     - The sender has enough tokens to cover the payment
    ///     - The sender is a whitelisted address
    /// @param _rewardTokenAmount The amount of reward tokens being used for the payment.
    function paymentRewardTokens (uint256 _rewardTokenAmount)
        public
        validAmount(_rewardTokenAmount)
        senderHasEnoughTokens(0, _rewardTokenAmount)
        isWhitelisted(msg.sender)
        whenNotPaused
    {
        rewardBalances[msg.sender] = rewardBalances[msg.sender].sub(_rewardTokenAmount);
        rewardBalances[owner] = rewardBalances[owner].add(_rewardTokenAmount);
        emit TransferReward(msg.sender, owner, _rewardTokenAmount);
    }
}