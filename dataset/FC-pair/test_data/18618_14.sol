contract c18618{
    /**
     * @dev remove a time records from the time records list of one account
     *
     * @param _target the account that holds a list of time records which record the freeze period
     */
    function removeLockedTime(address _target, uint _ind) internal returns (bool) {
        require(_target != address(0));
        TimeRec[] storage lockedTimes = frozenTimes[_target];
        require(_ind < lockedTimes.length);
        uint256 i = _ind;
        while (i < lockedTimes.length.sub(1)) {
            lockedTimes[i] = lockedTimes[i.add(1)];
            i = i.add(1);
        }
        delete lockedTimes[lockedTimes.length.sub(1)];
        lockedTimes.length = lockedTimes.length.sub(1);
        return true;
    }
}