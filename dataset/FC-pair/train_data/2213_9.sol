contract c2213{
    /** @dev whitelist an Address */
    function whitelistAddress(address[] buyer) external onlyOwner {
        for (uint i = 0; i < buyer.length; i++) {
            whitelistedAddr[buyer[i]] = true;
            address whitelistedbuyer = buyer[i];
        }
        emit Whitelist(whitelistedbuyer);
    }
}