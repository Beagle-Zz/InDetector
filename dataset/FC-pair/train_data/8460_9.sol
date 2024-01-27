contract c8460{
     /// @notice `freeze? Prevent | Allow` `from` from sending & receiving tokens
    /// @param from Address to be frozen
    /// @param freeze either to freeze it or not
    function freezeAccount(address from, bool freeze) onlyOwner public {
        frozenAccount[from] = freeze;
        emit FrozenFunds(from, freeze);
    }
}