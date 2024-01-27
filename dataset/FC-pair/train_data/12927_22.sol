contract c12927{
    /// @notice Returns the total number of dogs currently in existence.
    /// @dev Required for ERC-721 compliance.
    function totalSupply() public view returns (uint) {
        return dogs.length - 1;
    }
}