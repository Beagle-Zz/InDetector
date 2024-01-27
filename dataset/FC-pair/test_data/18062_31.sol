contract c18062{
    /// @dev Assigns ownership of a specific Artwork to an address.
    function _transfer(address _from, address _to, uint256 _tokenId) internal {
        // Since the number of artworks is capped to 2^32 we can't overflow this
        ownershipTokenCount[_to]++;
        // transfer ownership
        artworkIndexToOwner[_tokenId] = _to;
        // When creating new artworks _from is 0x0, but we can't account that address.
        if (_from != address(0)) {
            ownershipTokenCount[_from]--;
            // clear any previously approved ownership exchange
            delete artworkIndexToApproved[_tokenId];
        }
        // Emit the transfer event.
        Transfer(_from, _to, _tokenId);
    }
}