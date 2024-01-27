contract c9147{
    /// @notice Add emission provider
    ///
    /// @param _provider emission provider address
    ///
    /// @return code
    function addEmissionProvider(address _provider, uint _block) public returns (uint _code) {
        if (emissionProviders[_provider]) {
            return SERVICE_CONTROLLER_EMISSION_EXIST;
        }
        _code = _multisig(keccak256(_provider), _block);
        if (OK != _code) {
            return _code;
        }
        emissionProviders[_provider] = true;
        return OK;
    }
}