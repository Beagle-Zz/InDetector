contract c3961{
	// checks if a given address is the current owner of a particular pet
    function _owns(address _claimant, uint64 _tokenId) internal view returns (bool) {
        return petIndexToOwner[_tokenId] == _claimant;
    }
}