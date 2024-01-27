contract c8957{
    /// @notice Get balance of account
    /// @dev Get balance of '_owner'
    /// @param _owner Target address
    /// @return balance of '_owner'
    function balanceOf(address _owner) public view returns (uint256 balance){
        return balances[_owner];
    }
}