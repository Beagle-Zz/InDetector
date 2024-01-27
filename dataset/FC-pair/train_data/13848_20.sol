contract c13848{
    /**
     * QwasderToken interface.
     */
    /**
     * Add a new partner.
     */
    function addPartner(address investor) onlyOwner public returns (bool) {
        require(investor != address(0));
        require(!partners[investor] && !blacklisted[investor] && balances[investor] == 0);
        partners[investor] = true;
        PartnerAdded(investor);
        return partners[investor];
    }
}