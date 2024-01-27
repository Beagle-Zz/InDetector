contract c10353{
    /**
     * @dev allow owner to remove address from whitelist
     * @param _address address to be removed
     */
    function removeWhitelistedTransfer(address _address) onlyOwner public {
        whitelistedTransfer[_address] = false;
    }
}