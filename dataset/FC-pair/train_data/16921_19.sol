contract c16921{
    /// @notice Get the approved address for a single NFT
    /// @dev Throws if `_tokenId` is not a valid NFT
    /// @param _tokenId The NFT to find the approved address for
    /// @return The approved address for this NFT, or the zero address if there is none
    function getApproved(uint256 _tokenId) 
        external view canBeStoredIn40Bits(_tokenId) 
        returns (address)
    {
        require(_tokenId <= _totalSupply());
        if (cutieIndexToApproved[uint40(_tokenId)] != address(0))
        {
            return cutieIndexToApproved[uint40(_tokenId)];
        }
        address owner = cutieIndexToOwner[uint40(_tokenId)];
        return addressToApprovedAll[owner];
    }
}