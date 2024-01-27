contract c7962{
    /// @dev Returns a list of all Animecard IDs assigned to an address.
    /// @param _owner The owner whose Animecards we are interested in.
    ///  This method MUST NEVER be called by smart contract code. First, it is fairly
    ///  expensive (it walks the entire Animecard array looking for Animecard belonging
    /// to owner), but it also returns a dynamic array, which is only supported for web3
    /// calls, and not contract-to-contract calls. Thus, this method is external rather
    /// than public.
    function tokensOfOwner(address _owner)
    external
    view
    returns(uint256[] ownerTokens) {
        uint256 tokenCount = balanceOf(_owner);
        if (tokenCount == 0) {
            // Returns an empty array
            return new uint256[](0);
        } else {
            uint256[] memory result = new uint256[](tokenCount);
            uint256 totalAnimecards = totalSupply();
            uint256 resultIndex = 0;
            uint256 animecardId;
            for (animecardId = 0; animecardId <= totalAnimecards; animecardId++) {
                if (animecardToOwner[animecardId] == _owner) {
                    result[resultIndex] = animecardId;
                    resultIndex++;
                }
            }
            return result;
        }
    }
}