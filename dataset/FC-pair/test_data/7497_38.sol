contract c7497{
     /// @dev executes the update process via the proxyMaster for a new address _masterCopy
    function updateMasterCopy()
        public
        onlyCreator()
    {   
        require(address(masterCopyCountdown.masterCopy) != 0);
        require(now >= masterCopyCountdown.timeWhenAvailable);
        // Update masterCopy
        masterCopy = masterCopyCountdown.masterCopy;
    }
}