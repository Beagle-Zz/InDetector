contract c4863{
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
        uint _idx = burningMan2index[_burningMan];
        uint _lastIdx = burningMansCount;
        if (_idx != 0) {
            if (_idx != _lastIdx) {
                address _lastBurningMan = index2burningMan[_lastIdx];
                index2burningMan[_idx] = _lastBurningMan;
                burningMan2index[_lastBurningMan] = _idx;
            }
            delete burningMan2index[_burningMan];
            delete index2burningMan[_lastIdx];
            delete burningMans[_burningMan];
            burningMansCount = _lastIdx - 1;
        }
        return OK;
    }
}