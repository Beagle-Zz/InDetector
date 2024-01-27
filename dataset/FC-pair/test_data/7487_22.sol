contract c7487{
    /// @notice `onlyOwner` Adds a spender to the `allowedSpenders[]` white list
    /// @param _spender The address of the contract being authorized/unauthorized
    /// @param _authorize `true` if authorizing and `false` if unauthorizing
    function authorizeSpender(address _spender, bool _authorize) onlyOwner external {
        allowedSpenders[_spender] = _authorize;
        emit SpenderAuthorization(_spender, _authorize);
    }
}