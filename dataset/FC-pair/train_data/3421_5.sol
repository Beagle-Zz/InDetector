contract c3421{
    /// @dev Returns number of tokens owned by the given address.
    /// @param _owner Address of token owner.
    /// @return Returns balance of owner.
    function balanceOf(address _owner) constant public returns (uint) {
        return balances[_owner];
    }
}