contract c10267{
    /// @notice Total amount of country tokens.
    /// @dev Required for ERC-721 compliance.
    function totalSupply() public view returns (uint256 total) {
        return countries.length;
    }
}