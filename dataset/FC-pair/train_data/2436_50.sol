contract c2436{
    /// @param _owner The owner whose ships tokens we are interested in.
    /// @dev This method MUST NEVER be called by smart contract code. First, it's fairly
    ///  expensive (it walks the entire NFT owners array looking for NFT belonging to owner),
    ///  but it also returns a dynamic array, which is only supported for web3 calls, and
    ///  not contract-to-contract calls.
    function tokensOfOwner(address _owner) external view returns(uint256[] ownerTokens) {
        uint256 tokenCount = balanceOf(_owner);
        if (tokenCount == 0) {
            // Return an empty array
            return new uint256[](0);
        } else {
            uint256[] memory result = new uint256[](tokenCount);
            uint256 resultIndex = 0;
            // We count on the fact that all Asset have IDs starting at 0 and increasing
            // sequentially up to the total count.
            uint256 _itemIndex;
            for (_itemIndex = 0; _itemIndex < tokenCount; _itemIndex++) {
                result[resultIndex] = tokenOfOwnerByIndex(_owner,_itemIndex);
                resultIndex++;
            }
            return result;
        }
    }
}