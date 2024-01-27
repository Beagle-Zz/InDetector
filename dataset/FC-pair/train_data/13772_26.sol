contract c13772{
    /// @notice Returns the total number of EtherDogs currently in existence.
    /// @dev Required for ERC-721 compliance.
    function totalSupply() public view returns (uint) {
        return EtherDogs.length - 1;
    }
}