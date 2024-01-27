contract c7071{
    /// Gets the withdrawal timestamp of the specified address.
    function withdrawalTimeOf(address _owner) view public returns (uint256) {
        return records[_owner].timestamp.add(WITHDRAWAL_DELAY);
    }
}