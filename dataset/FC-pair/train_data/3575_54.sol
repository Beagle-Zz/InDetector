contract c3575{
    /**
     * @dev Internal function that sets whitelist status in batch.
     *
     * @param _entries An array with the entries to be updated
     * @param _status The new status to apply
     */
    function updateEntries(address[] _entries, bool _status) internal {
        for (uint32 i = 0; i < _entries.length; ++i) {
            whitelisted[_entries[i]] = _status;
        }
    }
}