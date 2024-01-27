contract c7962{
    /// @dev Returns the total number of Animecards currently in existence.
    /// @notice Required for ERC-20 and ERC-721 compliance.
    function totalSupply() public view returns(uint) {
        return animecards.length;
    }
}