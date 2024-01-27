contract c10774{
    /* to allow upgrade of Rates and MonetarySupervisor contracts */
    function setSystemContracts(Rates newRatesContract, MonetarySupervisor newMonetarySupervisor)
    external restrict("StabilityBoard") {
        rates = newRatesContract;
        monetarySupervisor = newMonetarySupervisor;
        emit SystemContractsChanged(newRatesContract, newMonetarySupervisor);
    }
}