contract c16772{
    /// @notice Returns the total number of Kitties currently in existence.
    /// @dev Required for ERC-721 compliance.
    function totalSupply() public view returns (uint) {
        return pets.length - 1;
    }
}