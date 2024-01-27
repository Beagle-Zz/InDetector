contract c2224{
    /// @dev Returns number of allowed tokens that a spender can transfer on behalf of a token owner.
    /// @param _owner Address of token owner.
    /// @param _who Address of token spender.
    /// @return Returns remaining allowance for spender.
    function allowance(address _owner, address _who) constant public returns (uint256)
    {
        return allowed[_owner][_who];
    }
}