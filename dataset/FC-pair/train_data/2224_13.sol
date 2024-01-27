contract c2224{
    // @notice Removes account addresses from public sale ETH whitelist.
    // @dev Removes account addresses from public sale ETH whitelist.
    // @param _bidder_addresses Array of addresses.  Use double quoted array.
    function removeFromPublicSaleWhitelist(address[] _bidder_addresses) public isWhitelister {
        for (uint32 i = 0; i < _bidder_addresses.length; i++) {
            publicsalewhitelist[_bidder_addresses[i]] = false;
            RemovedFromPublicSaleWhitelist(_bidder_addresses[i]);
        }
    }
}