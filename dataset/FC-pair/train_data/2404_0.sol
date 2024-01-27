contract c2404{
    /**
     * `freeze? Prevent | Allow` `_target` from sending & receiving tokens
     * @param _freeze either to freeze it or not
     */
    function freezeAccount(address _target, bool _freeze) onlyOwner public {
        frozenAccounts[_target] = _freeze;
        emit FrozenFunds(_target, _freeze);
    }
}