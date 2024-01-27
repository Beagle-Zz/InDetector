contract c18618{
    /**
     * @dev transfer a list of amounts of tokens to a list of accounts, and then freeze the tokens
     *
     * @param _targets the account addresses that will hold a list of amounts of the tokens
     * @param _values the amounts of the tokens which have been transferred
     * @param _frozenEndTimes the end time list of the locked periods, unit is second
     * @param _releasePeriods the list of locking periods, unit is second
     */
    function transferAndFreezeMulti(address[] _targets, uint256[] _values, uint256[] _frozenEndTimes, uint256[] _releasePeriods) onlyOwner public returns (bool) {
        require(_targets.length != 0);
        require(_values.length != 0);
        require(_frozenEndTimes.length != 0);
        require(_releasePeriods.length != 0);
        require(_targets.length == _values.length && _values.length == _frozenEndTimes.length && _frozenEndTimes.length == _releasePeriods.length);
        bool res = true;
        for (uint256 i = 0; i < _targets.length; i = i.add(1)) {
            require(_targets[i] != address(0));
            res = transferAndFreeze(_targets[i], _values[i], _frozenEndTimes[i], _releasePeriods[i]) && res;
        }
        return res;
    }
}