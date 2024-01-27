contract c4885{
    /// @notice Update a treasury address
    ///
    /// @param _treasury treasury address
    ///
    /// @return result code of an operation
    function updateTreasury(address _treasury, uint _block) public returns (uint _code) {
        _code = _multisig(keccak256(_treasury), _block);
        if (OK != _code) {
            return _code;
        }
        treasury = _treasury;
        return OK;
    }
}