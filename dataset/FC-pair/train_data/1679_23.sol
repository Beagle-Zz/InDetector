contract c1679{
    /** @dev Updates whitelist contract address
      * @param whitelistAddress New whitelist contract address
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