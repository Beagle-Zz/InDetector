contract c16921{
    /// @notice Returns the address currently assigned ownership of a given Cutie.
    /// @dev Required for ERC-721 compliance.
    function ownerOf(uint256 _cutieId)
        external
        view
        canBeStoredIn40Bits(_cutieId)
        returns (address owner)
    {
        owner = cutieIndexToOwner[uint40(_cutieId)];
        require(owner != address(0));
    }
}