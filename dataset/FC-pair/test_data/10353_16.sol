contract c10353{
    /**
     * @dev allow owner to add address to whitelist
     * @param _address address to be added
     */
    function addWhitelistedTransfer(address _address) onlyOwner public {
        whitelistedTransfer[_address] = true;
    }
}