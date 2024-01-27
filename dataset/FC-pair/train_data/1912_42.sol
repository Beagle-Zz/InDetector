contract c1912{
    /// @notice Removes users from whitelist.
    /// @param _blacklist user in whitelist.
    function removeUsers(address[] _blacklist) public onlyOracleOrOwner onlySale returns (uint) {
        for (uint _idx = 0; _idx < _blacklist.length; ++_idx) {
            delete whitelist[_blacklist[_idx]];
        }
        return OK;
    }
}