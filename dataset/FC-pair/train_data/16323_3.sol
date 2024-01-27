contract c16323{
    /**
     * @dev add addresses to the whitelist
     * @param addrs addresses
     * @return true if at least one address was added to the whitelist,
     * false if all addresses were already in the whitelist
     */
    function setKYCLevelsBulk(address[] addrs, uint8[] levels) onlyOwner external returns (bool success) {
        require(addrs.length == levels.length);
        for (uint256 i = 0; i < addrs.length; i++) {
            assert(setKYCLevel(addrs[i], levels[i]));
        }
        return true;
    }
}