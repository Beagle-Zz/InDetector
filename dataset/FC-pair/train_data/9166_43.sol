contract c9166{
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
        delete emissionProviders[_provider];
        return OK;
    }
}