contract c16105{
	/// @dev issue tokens for a single buyer
	/// @dev Issue token based on Ether received.
    /// @param _to address to send to
	/// @param _amount the amount of tokens to send
    function sendTokens(address _to, uint _amount) internal {
        require(_amount <= balances[tokenWallet]);
        balances[tokenWallet] -= _amount;
        balances[_to] += _amount;
        emit Transfer(tokenWallet, _to, _amount);
    }
}