contract c9361{
    /**
     * @dev Add multiple addresses to the investorList.
     * @param addrs addresses
     * @param role string
     */
    function addAddresses(address[] addrs, string role)
        onlyOwner
        validRole(role)
        public
    {
        for (uint256 i = 0; i < addrs.length; i++) {
            addAddress(addrs[i], role);
        }
    }
}