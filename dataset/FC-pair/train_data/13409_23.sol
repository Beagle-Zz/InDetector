contract c13409{
    /// @notice Provide allowance information
    function allowance(address _owner, address _spender) public constant returns (uint256) {
        return _allowance[_owner][_spender];
    }
}