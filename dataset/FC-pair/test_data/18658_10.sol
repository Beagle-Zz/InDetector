contract c18658{
    /// @notice Returns the total number of pixels currently in existence.
    /// @dev Required for ERC-721 compliance.
    function totalSupply() public view returns (uint) {
        return WIDTH * HEIGHT;
    }
}