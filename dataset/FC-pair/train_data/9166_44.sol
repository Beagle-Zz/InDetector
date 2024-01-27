contract c9166{
    /// @notice Add burning man
    ///
    /// @param _burningMan burning man address
    ///
    /// @return code
    function addBurningMan(address _burningMan, uint _block) public returns (uint _code) {
        if (burningMans[_burningMan]) {
            return SERVICE_CONTROLLER_BURNING_MAN_EXIST;
        }
        _code = _multisig(keccak256(_burningMan), _block);
        if (OK != _code) {
            return _code;
        }
        burningMans[_burningMan] = true;
        return OK;
    }
}