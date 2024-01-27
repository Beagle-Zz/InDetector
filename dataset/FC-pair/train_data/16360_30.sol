contract c16360{
    /// @dev Checks if a given address currently has transferApproval for a particular Asset.
    /// @param _tokenId asset UniqueId
    function approvedFor(uint256 _tokenId) public view onlyGrantedContracts returns (address) {
        return assetIndexToApproved[_tokenId];
    }
}