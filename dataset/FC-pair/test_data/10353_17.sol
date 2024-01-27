contract c10353{
    /**
     * @dev allow owner to batch add addresses to whitelist
     * @param _addresses address list to be added
     */
    function batchAddWhitelistedTransfer(address[] _addresses) onlyOwner public {
        for (uint256 i = 0; i < _addresses.length; i++) {
            whitelistedTransfer[_addresses[i]] = true;
        }
    }
}