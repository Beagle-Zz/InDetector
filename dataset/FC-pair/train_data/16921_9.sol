contract c16921{
    /// @notice Returns the number of Cuties owned by a specific address.
    /// @param _owner The owner address to check.
    /// @dev Required for ERC-721 compliance
    function balanceOf(address _owner) external view returns (uint256 count)
    {
        return ownershipTokenCount[_owner];
    }
}