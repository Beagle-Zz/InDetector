contract c16360{
    /*** GETTERS ***/
    /// @notice Returns only stats data about a specific asset.
    /// @dev it is necessary due solidity compiler limitations
    ///      when we have large qty of parameters it throws StackTooDeepException
    /// @param _tokenId The UniqueId of the asset of interest.
    function getStats(uint256 _tokenId) public view returns (uint8[STATS_SIZE]) {
        return assets[_tokenId].stats;
    }
}