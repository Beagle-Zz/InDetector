contract c7044{
    /**
     * @dev Returns true if given address in ICO whitelist
     */
    function whitelisted(address address_) public view returns (bool) {
        if (whitelistEnabled) {
            return whitelist[address_];
        } else {
            return true;
        }
    }
}