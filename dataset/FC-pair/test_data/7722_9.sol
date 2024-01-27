contract c7722{
    /// @dev Set the address of the sibling contract that tracks metadata.
    ///  CEO only.
    function setMetadataAddress(address _contractAddress) public onlyOwner {
        erc721Metadata = ERC721Metadata(_contractAddress);
    }
}