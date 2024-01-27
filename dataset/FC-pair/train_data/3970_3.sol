contract c3970{
    /// @dev increase the token's supply
    function increaseSupply (uint256 _value) isOwner external {
        uint256 value = formatDecimals(_value);
        if (value + currentSupply > totalSupply) throw;
        currentSupply = safeAdd(currentSupply, value);
        IncreaseSupply(value);
    }
}