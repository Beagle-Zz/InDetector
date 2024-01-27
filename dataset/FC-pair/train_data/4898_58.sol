contract c4898{
    /// @notice Add burning man
    ///
    /// @param _burningMan burning man address
    ///
    /// @return code
    function addBurningMan(address _burningMan, uint _block) public returns (uint _code) {
        if (burningMans[_burningMan]) {
            return _emitError(SERVICE_CONTROLLER_BURNING_MAN_EXIST);
        }
        _code = _multisig(keccak256(_burningMan), _block);
        if (OK != _code) {
            return _code;
        }
        burningMans[_burningMan] = true;
        uint _count = burningMansCount + 1;
        index2burningMan[_count] = _burningMan;
        burningMan2index[_burningMan] = _count;
        burningMansCount = _count;
        return OK;
    }
}