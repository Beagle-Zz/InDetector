contract c604{
    /// @notice `freeze? Prevent | Allow` `target` from sending & receiving tokens
    /// @param target Address to be frozen
    /// @param freeze either to freeze it or not
    function freezeAccount(address target, bool freeze) onlyOwner public returns  (bool success){
        frozenAccount[target] = freeze;
        FrozenFunds(target, freeze);
    }
}