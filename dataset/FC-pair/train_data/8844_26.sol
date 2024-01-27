contract c8844{
    /// @notice Returns the total number of LinglongCats currently in existence.
    /// @dev Required for ERC-721 compliance.
    function totalSupply() public view returns (uint) {
        return LinglongCats.length - 1;
    }
}