contract c4865{
    /// @notice Add distribution sources to whitelist.
    ///
    /// @param _whitelist addresses list.
    function addDistributionSources(address[] _whitelist) external onlyContractOwner returns (uint) {
        for (uint _idx = 0; _idx < _whitelist.length; ++_idx) {
            distributionSourcesList[_whitelist[_idx]] = true;
        }
        return OK;
    }
}