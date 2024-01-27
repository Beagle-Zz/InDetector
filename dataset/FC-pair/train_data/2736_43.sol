contract c2736{
    /// @dev To change the EthPriceFeed contract if needed 
    function changeEthPriceFeed(EthPriceFeedI _ethPriceFeed) external onlyOwner {
        require(_ethPriceFeed != address(0));
        emit EthPriceFeedChanged(ethPriceFeed, _ethPriceFeed);
        ethPriceFeed = _ethPriceFeed;
    }
}