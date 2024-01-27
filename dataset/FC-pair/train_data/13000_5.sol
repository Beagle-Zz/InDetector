contract c13000{
    /// @dev Gets the balance of the specified address.
    /// @param _owner address The address to query the the balance of.
    /// @return uint256 representing the amount owned by the passed address.
    function balanceOf(address _owner) constant public returns (uint256 balance) {
        return balances[_owner];
    }
}