contract c8844{
    /// @notice Returns a list of all LinglongCat IDs assigned to an address.
    /// @param _owner The owner whose LinglongCats we are interested in.
    /// @dev This method MUST NEVER be called by smart contract code. First, it's fairly
    ///  expensive (it walks the entire LinglongCat array looking for cats belonging to owner),
    ///  but it also returns a dynamic array, which is only supported for web3 calls, and
    ///  not contract-to-contract calls.
    function tokensOfOwner(address _owner) external view returns(uint256[] ownerTokens) {
        uint256 tokenCount = balanceOf(_owner);
        if (tokenCount == 0) {
            // Return an empty array
            return new uint256[](0);
        } else {
            uint256[] memory result = new uint256[](tokenCount);
            uint256 totalcats = totalSupply();
            uint256 resultIndex = 0;
            // We count on the fact that all cats have IDs starting at 1 and increasing
            // sequentially up to the totalcat count.
            uint256 catId;
            for (catId = 1; catId <= totalcats; catId++) {
                if (LinglongCatIndexToOwner[catId] == _owner) {
                    result[resultIndex] = catId;
                    resultIndex++;
                }
            }
            return result;
        }
    }
}