contract c16360{
    /// @dev Required for ERC-721 compliance
    /// @notice Returns the number of Assets owned by a specific address.
    /// @param _owner The owner address to check.
    function balanceOf(address _owner) public view returns (uint256 count) {
        return ownershipTokenCount[_owner];
    }
}