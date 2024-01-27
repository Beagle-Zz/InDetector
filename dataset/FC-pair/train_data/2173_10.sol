contract c2173{
    /** @dev black list an address **/
    function blacklistAddr(address[] buyer) external onlyOwner {
        for (uint i = 0; i < buyer.length; i++) {
            whitelistedAddr[buyer[i]] = false;
            address blacklistedbuyer = buyer[i];
        }
        emit Blacklist(blacklistedbuyer);
    }
}