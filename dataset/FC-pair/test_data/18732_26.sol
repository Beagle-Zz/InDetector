contract c18732{
    /**
    * @notice `freeze? Prevent | Allow` `target` from sending & receiving tokens
    * @param target Address to be frozen
    * @param freeze either to freeze it or not
    */
    function _freezeAccount(address target, bool freeze) internal {
        frozenAccount[target] = freeze;
        emit FrozenFunds(target, freeze);
    }
}