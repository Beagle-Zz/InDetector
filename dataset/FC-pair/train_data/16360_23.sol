contract c16360{
    /// @dev return current price of an asset
    /// @param _tokenId asset UniqueId
    function priceOf(uint256 _tokenId) public view returns (uint256 price) {
        return assetIndexToPrice[_tokenId];
    }
}