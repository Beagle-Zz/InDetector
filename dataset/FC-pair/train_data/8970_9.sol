contract c8970{
    /// @notice `freeze? Prevent | Allow` `target` from sending & receiving tokens
    /// @param _target Address to be frozen
    /// @param _freeze either to freeze it or not
    function freezeAccount(address _target, bool _freeze) onlyOwner public {
        frozenAccount[_target] = _freeze;
        emit FrozenFunds(_target, _freeze);
    }
}