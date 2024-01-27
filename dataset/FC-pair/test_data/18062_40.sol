contract c18062{
    /// @notice Returns a list of all Artwork IDs assigned to an address.
    /// @param _owner The owner whose Artworks we are interested in.
    /// @dev This method MUST NEVER be called by smart contract code. First, it's fairly
    ///  expensive (it walks the entire Artwork array looking for arts belonging to owner),
    ///  but it also returns a dynamic array, which is only supported for web3 calls, and
    ///  not contract-to-contract calls.
    function tokensOfOwner(address _owner) external view returns(uint256[] ownerTokens) {
        uint256 tokenCount = balanceOf(_owner);
        if (tokenCount == 0) {
            // Return an empty array
            return new uint256[](0);
        } else {
            uint256[] memory result = new uint256[](tokenCount);
            uint256 totalArts = totalSupply();
            uint256 resultIndex = 0;
            // We count on the fact that all arts have IDs starting at 1 and increasing
            // sequentially up to the totalArt count.
            uint256 artworkId;
            for (artworkId = 1; artworkId <= totalArts; artworkId++) {
                if (artworkIndexToOwner[artworkId] == _owner) {
                    result[resultIndex] = artworkId;
                    resultIndex++;
                }
            }
            return result;
        }
    }
}