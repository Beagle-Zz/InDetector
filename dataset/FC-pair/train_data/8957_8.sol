contract c8957{
    /// @notice Get the amount which '_spender' is still allowed to withdraw from '_owner'
    /// @dev Get the amount which '_spender' is still allowed to withdraw from '_owner'
    /// @param _owner Target address
    /// @param _spender The address authorized to spend
    /// @return The max amount can spend
    function allowance(address _owner, address _spender) public view returns (uint256 remaining){
        return allowance[_owner][_spender];
    }
}