contract c1384{
    // Set the exchange oracle after crowdsale 
    function setExchangeOracle(address exchangeOracleAddress) external onlyOwner nonZeroAddress(exchangeOracleAddress) {
        aiurExchangeOracle = ExchangeOracle(exchangeOracleAddress);
    }
}