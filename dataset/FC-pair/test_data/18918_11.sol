contract c18918{
    /// @dev Assigns ownership of a specific Rabbit to an address.
    function _transItem(address _from, address _to, uint _tokenId) internal {
        // Since the number of rabbits is capped to 2^32 we can't overflow this
        howManyDoYouHave[_to]++;
        // transfer ownership
        rabbitToOwner[_tokenId] = _to;
        // When creating new rabbits _from is 0x0, but we can't account that address.
        if (_from != address(0)) {
            howManyDoYouHave[_from]--;
        }
        // clear any previously approved ownership exchange
        delete rabbitToApproved[_tokenId];
        // Emit the transfer event.
		if (_tokenId > 0) {
			emit Transfer(_from, _to, _tokenId);
		}
    }
}