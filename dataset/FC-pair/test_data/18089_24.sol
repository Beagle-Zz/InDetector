contract c18089{
    /**
     * @dev Set token price once before start of crowdsale
     */
    function setTokenPrice(uint256 _tokenPriceNum, uint256 _tokenPriceDenom) public onlyOwner {
        require(tokenPriceNum == 0 && tokenPriceDenom == 0);
        require(_tokenPriceNum > 0 && _tokenPriceDenom > 0);
        tokenPriceNum = _tokenPriceNum;
        tokenPriceDenom = _tokenPriceDenom;
    }
}