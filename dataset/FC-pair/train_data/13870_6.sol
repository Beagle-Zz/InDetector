contract c13870{
    /// @notice Burns `_amount` tokens from `_owner`
    /// @param _user The address that will lose the tokens
    /// @param _amount The quantity of tokens to burn
    /// @return True if the tokens are burned correctly
    function destroyTokens(address _user, uint256 _amount) onlyOwner public returns (bool) {
        _amount=_amount*10**uint256(decimals);
        return _destroyTokens(_user,_amount);
    }
}