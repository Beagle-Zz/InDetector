contract c13748{
    /// @return The balance of `_owner`
    function balanceOf(address _owner) public constant returns (uint256 balance) {
        return balances[_owner];
    }
}