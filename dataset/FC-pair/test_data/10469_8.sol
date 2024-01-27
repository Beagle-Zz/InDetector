contract c10469{
    /// @notice Deposits '_value' in wei to the reserve address
    /// @param _value The number of wei to be transferred to the 
    /// reserve address
    function deposit(uint256 _value) private {
        reserveAddress.transfer(_value);
        balances[reserveAddress] += _value;
    }
}