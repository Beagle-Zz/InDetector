contract c7071{
    /// Gets the balance of the specified address.
    function balanceOf(address _owner) view public returns (uint256) {
        return records[_owner].amount;
    }
}