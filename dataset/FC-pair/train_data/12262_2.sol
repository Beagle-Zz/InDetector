contract c12262{
    /// @dev increase the token's supply
    function increaseSupply (uint256 _value) isOwner external {
        uint256 value = formatDecimals(_value);
        require (value + currentSupply <= totalSupply);
        require (balances[msg.sender] >= value && value>0);
        balances[msg.sender] -= value;
        currentSupply = safeAdd(currentSupply, value);
        IncreaseSupply(value);
    }
}