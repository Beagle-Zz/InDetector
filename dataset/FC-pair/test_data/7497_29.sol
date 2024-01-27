contract c7497{
    /// @dev Returns total supply of tokens
    /// @return Total supply
    function totalSupply()
        public
        view
        returns (uint)
    {
        return totalTokens;
    }
}