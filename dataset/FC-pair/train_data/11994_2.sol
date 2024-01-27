contract c11994{
    // Get all token IDs of address
    function tokensOfOwner(address _owner) external view returns(uint256[] ownerTokens) 
    {
        uint256 tokenCount = balanceOf(_owner);
        if (tokenCount == 0) 
        {
            // Return an empty array
            return new uint256[](0);
        } else 
        {
            uint256[] memory result = new uint256[](tokenCount);
            uint256 resultIndex = 0;
            // We count on the fact that all cats have IDs starting at 1 and increasing
            // sequentially up to the totalCat count.
            uint256 tokenId;
            for (tokenId = 0; tokenId < packages.length; tokenId++) 
            {
                if (tokenOwner[tokenId] == _owner) 
                {
                    result[resultIndex] = tokenId;
                    resultIndex++;
                }
            }
            return result;
        }
    }
}