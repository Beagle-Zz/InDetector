contract c7962{
    /// @dev Returns the number of Animecards owned by a specific address.
    /// @param _owner The owner address to check.
    /// @notice Required for ERC-20 and ERC-721 compliance.
    function balanceOf(address _owner)
    public
    view
    returns(uint256 count) {
        return ownerAnimecardCount[_owner];
    }
}