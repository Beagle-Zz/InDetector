contract c10952{
    /*
        @dev allows the owner to update & enable the conversion whitelist contract address
        when set, only addresses that are whitelisted are actually allowed to use the converter
        note that the whitelist check is actually done by the BancorNetwork contract
        @param _whitelist    address of a whitelist contract
    */
    function setConversionWhitelist(IWhitelist _whitelist)
        public
        ownerOnly
        notThis(_whitelist)
    {
        conversionWhitelist = _whitelist;
    }
}