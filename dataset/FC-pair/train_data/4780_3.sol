contract c4780{
    /// @dev Internal function to determine if an address is a contract
    function addLockStep(uint8 _step, uint _endTime) onlyController external returns(bool) {
        stepLockend[_step] = _endTime;
    }
}