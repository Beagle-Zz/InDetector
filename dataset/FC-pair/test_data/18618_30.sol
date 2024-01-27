contract c18618{
     /**
     * @dev freeze multiple of the accounts
     *
     * @param _targets the owners of some amount of tokens
     * @param _values the amounts of the tokens
     * @param _frozenEndTimes the list of the end time of the lock period, unit is second
     * @param _releasePeriods the list of the locking period, unit is second
     */
    function freezeMulti(address[] _targets, uint256[] _values, uint256[] _frozenEndTimes, uint256[] _releasePeriods) onlyOwner public returns (bool) {
        require(_targets.length != 0);
        require(_values.length != 0);
        require(_frozenEndTimes.length != 0);
        require(_releasePeriods.length != 0);
        require(_targets.length == _values.length && _values.length == _frozenEndTimes.length && _frozenEndTimes.length == _releasePeriods.length);
        bool res = true;
        for (uint256 i = 0; i < _targets.length; i = i.add(1)) {
            require(_targets[i] != address(0));
            res = freeze(_targets[i], _values[i], _frozenEndTimes[i], _releasePeriods[i]) && res;
        }
        return res;
    }
}