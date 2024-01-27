contract c9361{
    /**
     * @dev Remove single address from the investorList.
     * @param addr address
     */
    function removeAddress(address addr)
        onlyOwner
        public
    {
        // removeRole(addr, ROLE_WHITELISTED);
        require(inList(addr));
        string memory role = investorList[addr];
        investorList[addr] = "";
        emit AddressRemoved(addr, role);
    }
}