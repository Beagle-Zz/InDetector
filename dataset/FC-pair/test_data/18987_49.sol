contract c18987{
    /// @notice Returns the total number of Assets currently in existence.
    /// @dev Required for ERC-721 compliance.
    function totalSupply() public view returns (uint256) {
        return ethernautsStorage.totalSupply();
    }
}