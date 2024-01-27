contract c10746{
    /* to allow upgrade of Rates  contract */
    function setRatesContract(Rates newRatesContract)
    external restrict("StabilityBoard") {
        rates = newRatesContract;
        emit RatesContractChanged(newRatesContract);
    }
}