contract c4905{
    /// @notice Remove emission provider
    ///
    /// @param _provider emission provider address
    ///
    /// @return code
    function removeEmissionProvider(address _provider, uint _block) public returns (uint _code) {
        _code = _multisig(keccak256(_provider), _block);
        if (OK != _code) {
            return _code;
        }
        uint _idx = emissionProvider2index[_provider];
        uint _lastIdx = emissionProvidersCount;
        if (_idx != 0) {
            if (_idx != _lastIdx) {
                address _lastEmissionProvider = index2emissionProvider[_lastIdx];
                index2emissionProvider[_idx] = _lastEmissionProvider;
                emissionProvider2index[_lastEmissionProvider] = _idx;
            }
            delete emissionProvider2index[_provider];
            delete index2emissionProvider[_lastIdx];
            delete emissionProviders[_provider];
            emissionProvidersCount = _lastIdx - 1;
        }
        return OK;
    }
}