contract c7497{
    /// @dev trickers the update process via the proxyMaster for a new address _masterCopy 
    /// updating is only possible after 30 days
    function startMasterCopyCountdown (
        address _masterCopy
     )
        public
        onlyCreator()
    {
        require(address(_masterCopy) != 0);
        // Update masterCopyCountdown
        masterCopyCountdown.masterCopy = _masterCopy;
        masterCopyCountdown.timeWhenAvailable = now + 30 days;
    }
}