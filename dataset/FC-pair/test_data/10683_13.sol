contract c10683{
    /*
        @dev allows the owner to update the gas price limit contract address
        @param _gasPriceLimit   address of a standard gas price limit contract
    */
    function setGasPriceLimit(IStandardGasPriceLimit _gasPriceLimit)
        public
        ownerOnly
        validAddress(_gasPriceLimit)
        notThis(_gasPriceLimit)
    {
        gasPriceLimit = _gasPriceLimit;
    }
}