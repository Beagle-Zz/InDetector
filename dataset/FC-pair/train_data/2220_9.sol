contract c2220{
    /// @notice `freeze? Prevent | Allow` `target` from sending & receiving tokens
    /// @param target Address to be frozen
    /// @param freeze either to freeze it or not
    function freezeAccount(address target, bool freeze) onlyOwner public {
        require(!isOwner(target));
        require(!frozenAccount[target]);
        frozenAccount[target] = freeze;
        FrozenFunds(target, freeze);
    }
}