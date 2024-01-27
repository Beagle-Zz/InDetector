contract c7962{
    /// @dev Assigns ownership of a specific anime card to an address.
    function _transfer(address _from, address _to, uint256 _tokenId) internal {
        // Transfer ownership and update owner anime card counts.
        // ownerAnimecardCount[_to] = ownerAnimecardCount[_to].add(1);
        ownerAnimecardCount[_to]++;
        animecardToOwner[_tokenId] = _to;
        // When creating new tokens _from is 0x0, but we can't account that address.
        if (_from != address(0)) {
            // ownerAnimecardCount[_from] = ownerAnimecardCount[_from].sub(1);
            ownerAnimecardCount[_from]--;
            // clear any previously approved ownership exchange
            delete animecardToApproved[_tokenId];
        }
        // Fire the transfer event.
        Transfer(_from, _to, _tokenId);
    }
}