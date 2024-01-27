contract c7942{
    /// @dev increase the token's supply
    function increaseSupply (uint256 _value) isOwner external {
        uint256 value = formatDecimals(_value);
        require (value + currentSupply <= totalSupply);
        currentSupply = safeAdd(currentSupply, value);
        emit IncreaseSupply(value);
    }
}