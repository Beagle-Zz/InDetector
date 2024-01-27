contract c16976{
    /// @notice freeze multiple addresses
    /// @param addresses to freeze
    /// @param freeze or not
    function freezeMultiAccounts(address[] addresses, bool freeze) onlyOwner public {
        for (uint i = 0; i < addresses.length; i++) {
            frozenAccount[addresses[i]] = freeze;
            FrozenFunds(addresses[i], freeze);
        }
    }
}