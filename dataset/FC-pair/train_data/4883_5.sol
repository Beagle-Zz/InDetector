contract c4883{
    /// @notice Add oracles to whitelist.
    ///
    /// @param _whitelist user list.
    function addOracles(address[] _whitelist) 
    onlyContractOwner 
    external 
    returns (uint) 
    {
        for (uint _idx = 0; _idx < _whitelist.length; ++_idx) {
            address _oracle = _whitelist[_idx];
            if (_oracle != 0x0 && !oracles[_oracle]) {
                oracles[_oracle] = true;
                _emitOracleAdded(_oracle);
            }
        }
        return OK;
    }
}