contract c9166{
    /// @notice Remove burning man
    ///
    /// @param _burningMan burning man address
    ///
    /// @return code
    function removeBurningMan(address _burningMan, uint _block) public returns (uint _code) {
        _code = _multisig(keccak256(_burningMan), _block);
        if (OK != _code) {
            return _code;
        }
        delete burningMans[_burningMan];
        return OK;
    }
}