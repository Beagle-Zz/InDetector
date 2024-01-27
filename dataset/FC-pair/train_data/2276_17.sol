contract c2276{
    /**
     * @dev Allow operators to update whitelist contracts in bulk
     * @param _addresses Array of addresses to be processed
     * @param _whitelisted Boolean value -- to add or remove from whitelist
     */
    function whitelistAddresses(address[] _addresses, bool _whitelisted) public onlyOperator {
        for (uint i = 0; i < _addresses.length; i++) {
            address addr = _addresses[i];
            if (isWhitelisted[addr] == _whitelisted) continue;
            if (_whitelisted) {
                addToWhitelist(addr);
            } else {
                removeFromWhitelist(addr);
            }
        }
    }
}