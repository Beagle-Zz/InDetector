contract c2224{
/*
---------------------------------------------------------------------------------------------
    Functions related to whitelisting of presale and public sale ETH addresses.
    The Whitelister must add the participant's ETH address before they can bid.
---------------------------------------------------------------------------------------------
*/
    // @notice Adds account addresses to public sale ETH whitelist.
    // @dev Adds account addresses to public sale ETH whitelist.
    // @param _bidder_addresses Array of addresses. Use double quoted array.
    function addToPublicSaleWhitelist(address[] _bidder_addresses) public isWhitelister {
        for (uint32 i = 0; i < _bidder_addresses.length; i++) {
            require(!privatesalewhitelist[_bidder_addresses[i]]); //Can't be in public whitelist
            publicsalewhitelist[_bidder_addresses[i]] = true;
            PublicSaleWhitelisted(_bidder_addresses[i]);
        }
    }
}