contract c2446{
    /**
     * @dev allow transfer tokens or not
     * @param _from The address to transfer from.
     */
    modifier allowTransfer(address _from) {
        require(!isICO, "ICO phase");
        if (frozenAccounts[_from].frozen) {
            require(frozenAccounts[_from].until != 0 && frozenAccounts[_from].until < now, "Frozen account");
            delete frozenAccounts[_from];
        }
        _;
    }
}