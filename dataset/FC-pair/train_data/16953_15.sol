contract c16953{
    /**
    * Update currency exchange rates; all purchases are still billed in DATAcoin
    * @param timestamp in seconds when the exchange rates were last updated
    * @param dataUsd how many data atoms (10^-18 DATA) equal one USD dollar
    */
    function updateExchangeRates(uint timestamp, uint dataUsd) public {
        require(msg.sender == currencyUpdateAgent, "error_notPermitted");
        require(dataUsd > 0);
        dataPerUsd = dataUsd;
        emit ExchangeRatesUpdated(timestamp, dataUsd);
    }
}