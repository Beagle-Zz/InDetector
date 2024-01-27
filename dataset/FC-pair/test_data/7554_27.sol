contract c7554{
    /// @dev Returns number of allowed tokens for given address
    /// @param owner Address of token owner
    /// @param spender Address of token spender
    /// @return Remaining allowance for spender
    function allowance(address owner, address spender)
        public
        view
        returns (uint)
    {
        return allowances[owner][spender];
    }
}