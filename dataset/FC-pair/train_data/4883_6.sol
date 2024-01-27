contract c4883{
    /// @notice Removes oracles from whitelist.
    ///
    /// @param _blacklist user in whitelist.
    function removeOracles(address[] _blacklist) 
    onlyContractOwner 
    external 
    returns (uint) 
    {
        for (uint _idx = 0; _idx < _blacklist.length; ++_idx) {
            address _oracle = _blacklist[_idx];
            if (_oracle != 0x0 && oracles[_oracle]) {
                delete oracles[_oracle];
                _emitOracleRemoved(_oracle);
            }
        }
        return OK;
    }
}