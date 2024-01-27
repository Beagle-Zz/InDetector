contract c7497{
    /// @dev Returns number of tokens owned by given address
    /// @param owner Address of token owner
    /// @return Balance of owner
    function balanceOf(address owner)
        public
        view
        returns (uint)
    {
        return balances[owner];
    }
}