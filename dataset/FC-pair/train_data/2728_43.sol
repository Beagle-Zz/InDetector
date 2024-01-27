contract c2728{
    /// @notice Convert a specific amount of regular TRVL tokens from the owner, into reward tokens for a user.
    /// @dev Converts the regular tokens into reward tokens at a 1-1 ratio.
    /// Requires:
    ///     - Owner has enough tokens to convert
    ///     - The specified user is whitelisted
    ///     - The amount being converted is greater than 0
    /// @param _user The user receiving the converted tokens.
    /// @param _amount The amount of tokens to be converted.
    function convertRegularToRewardTokens(address _user, uint256 _amount)
        external
        onlyOwner
        validAmount(_amount)
        senderHasEnoughTokens(_amount, 0)
        isWhitelisted(_user)
    {
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        rewardBalances[_user] = rewardBalances[_user].add(_amount);
        emit TransferReward(msg.sender, _user, _amount);
    }
}