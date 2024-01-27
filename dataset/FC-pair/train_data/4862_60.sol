contract c4862{
    /// @notice Update a profiterole address
    ///
    /// @param _profiterole profiterole address
    ///
    /// @return result code of an operation
    function updateProfiterole(address _profiterole, uint _block) public returns (uint _code) {
        _code = _multisig(keccak256(_profiterole), _block);
        if (OK != _code) {
            return _code;
        }
        profiterole = _profiterole;
        return OK;
    }
}