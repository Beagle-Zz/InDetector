contract c10267{
    /// Check for token ownership
    function _owns(address claimant, uint256 _tokenId) private view returns (bool) {
        return claimant == countryIndexToOwner[_tokenId];
    }
}