contract c16360{
    /// @notice Returns the number of Assets owned by a specific address.
    /// @param _owner The owner address to check.
    /// @dev Required for ERC-721 compliance
    function balanceOf(address _owner) public view returns (uint256 count) {
        return ethernautsStorage.balanceOf(_owner);
    }
}