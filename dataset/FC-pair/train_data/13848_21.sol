contract c13848{
    /**
     * Remove a partner.
     */
    function removePartner(address investor) onlyOwner public returns (bool) {
        require(partners[investor] && balances[investor] == 0);
        partners[investor] = false;
        PartnerRemoved(investor);
        return !partners[investor];
    }
}