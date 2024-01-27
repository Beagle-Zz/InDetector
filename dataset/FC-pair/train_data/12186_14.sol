contract c12186{
    /// @notice Used to look up the allowance of someone
    function allowance(address _owner, address _spender)
        public
        constant 
        returns (uint256 _amount)
    {
        return allowance[_owner][_spender];
    }
}