contract c1680{
    /** @dev Updates whitelist contract address
      * @param whitelistAddress address of the new whitelist contract 
      */
    function setWhitelistContract(address whitelistAddress)
        public 
        onlyValidator 
        checkIsAddressValid(whitelistAddress)
    {
        whiteListingContract = Whitelist(whitelistAddress);
        emit WhiteListingContractSet(whiteListingContract);
    }
}