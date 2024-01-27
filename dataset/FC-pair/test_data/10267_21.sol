contract c10267{
    /// @notice Get all tokens of a particular address
    function tokensOfOwner(address _owner) public view returns(uint256[] ownerTokens) {
        uint256 tokenCount = balanceOf(_owner);
        if (tokenCount == 0) {
            // Return an empty array
            return new uint256[](0);
        } else {
            uint256[] memory result = new uint256[](tokenCount);
            uint256 totalCountries = totalSupply();
            uint256 resultIndex = 0;
            uint256 countryId;
            for (countryId = 0; countryId < totalCountries; countryId++) {
                if (countryIndexToOwner[countryId] == _owner)
                {
                    result[resultIndex] = countryId;
                    resultIndex++;
                }
            }
            return result;
        }
    }
}