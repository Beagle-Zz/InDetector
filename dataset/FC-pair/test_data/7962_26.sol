contract c7962{
    /// @dev Returns the address currently assigned ownership of a given Animecard.
    /// @notice Required for ERC-721 compliance.
    function ownerOf(uint256 _tokenId)
    external
    view
    returns(address _owner) {
        _owner = animecardToOwner[_tokenId];
        require(_owner != address(0));
    }
}