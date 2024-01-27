contract c8650{
    /// expensive call count of all tokens per owner
    function tokensOfOwner(address _owner) external view returns(uint256[] ownerTokens) {
        uint256 tokenCount = balanceOf(_owner);
        if (tokenCount == 0) {
            // Return an empty array
            return new uint256[](0);
        } else {
            uint256[] memory result = new uint256[](tokenCount);
            uint256 totalCards = totalSupply();
            uint256 resultIndex = 0;
            // We count on the fact that all cats have IDs starting at 1 and increasing
            // sequentially up to the totalCat count.
            uint256 tokId;
            for (tokId = 1; tokId <= totalCards ; tokId++) {
                if (cardToOwner[tokId] == _owner) {
                    result[resultIndex] = tokId;
                    resultIndex++;
                }
            }
            return result;
        }
    }
}