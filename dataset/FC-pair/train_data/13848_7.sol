contract c13848{
    /**
     * GrantableToken modifiers.
     */
    modifier canGrant() {
        require(now >= grantsUnlock && reservedSupply > 0);
        _;
    }
}