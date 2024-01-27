contract c7942{
    /// @dev decrease the token's supply
    function decreaseSupply (uint256 _value) isOwner external {
        uint256 value = formatDecimals(_value);
        require (value + tokenRaised <= currentSupply);
        currentSupply = safeSubtract(currentSupply, value);
        emit DecreaseSupply(value);
    }
}