contract c18987{
    /// @dev Mark transfer as approved
    /// @param _tokenId  asset UniqueId
    /// @param _approved address approved
    function approve(uint256 _tokenId, address _approved) public onlyGrantedContracts {
        assetIndexToApproved[_tokenId] = _approved;
    }
}