contract c18918{
    /// @notice Returns the total number of rabbits currently in existence.
    /// @dev Required for ERC-721 compliance.
    function totalSupply() public view returns (uint) {
        return rabbits.length - 1;
    }
}