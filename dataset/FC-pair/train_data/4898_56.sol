contract c4898{
    /// @notice Add emission provider
    ///
    /// @param _provider emission provider address
    ///
    /// @return code
    function addEmissionProvider(address _provider, uint _block) public returns (uint _code) {
        if (emissionProviders[_provider]) {
            return _emitError(SERVICE_CONTROLLER_EMISSION_EXIST);
        }
        _code = _multisig(keccak256(_provider), _block);
        if (OK != _code) {
            return _code;
        }
        emissionProviders[_provider] = true;
        uint _count = emissionProvidersCount + 1;
        index2emissionProvider[_count] = _provider;
        emissionProvider2index[_provider] = _count;
        emissionProvidersCount = _count;
        return OK;
    }
}