contract c10267{
    /// @dev Assigns ownership of a specific Country to an address.
    function _transfer(address _from, address _to, uint256 _tokenId) private {
        // clear any previously approved ownership exchange
        delete countryIndexToApproved[_tokenId];
        // Since the number of countries is capped to 32 we can't overflow this
        ownershipTokenCount[_to] = ownershipTokenCount[_to].add(1);
        //transfer ownership
        countryIndexToOwner[_tokenId] = _to;
        ownershipTokenCount[_from] = ownershipTokenCount[_from].sub(1);
        // Emit the transfer event.
        emit Transfer(_from, _to, _tokenId);
    }
}