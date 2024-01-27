contract c2728{
    /// @notice Process a payment that prioritizes the use of reward tokens.
    /// @dev Uses up all of the available reward tokens, before using regular tokens to cover a payment. Pushes the calculated amounts
    /// into their respective function calls.
    /// @param _amount The total tokens to be paid.
    function paymentRewardTokensPriority (uint256 _amount, uint256 _rewardPercentageIndex) public {
        uint256 rewardTokensAvailable = rewardBalances[msg.sender];
        if (rewardTokensAvailable >= _amount) {
            paymentRewardTokens(_amount);
        } else {
            if (rewardTokensAvailable > 0) {
                uint256 amountOfRegularTokens = _amount.sub(rewardTokensAvailable);
                paymentMixed(amountOfRegularTokens, rewardTokensAvailable, _rewardPercentageIndex);
            } else {
                paymentRegularTokens(_amount, _rewardPercentageIndex);
            }
        }
    }
}