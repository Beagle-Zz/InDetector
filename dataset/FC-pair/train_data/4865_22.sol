contract c4865{
    /// @notice Removes distribution sources from whitelist.
    /// Only for contract owner.
    ///
    /// @param _blacklist addresses in whitelist.
    function removeDistributionSources(address[] _blacklist) external onlyContractOwner returns (uint) {
        for (uint _idx = 0; _idx < _blacklist.length; ++_idx) {
            delete distributionSourcesList[_blacklist[_idx]];
        }
        return OK;
    }
}