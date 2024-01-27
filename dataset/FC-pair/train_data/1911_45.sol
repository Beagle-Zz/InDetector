contract c1911{
    /// @notice Performs finish hardcap manually
    /// Only by contract owner and in sale period
    function finishHardcap() public onlyContractOwner onlySale notHardcapReached returns (uint) {
        finishedHardcap = true;
        _emitHardcapFinishedManually();
        return OK;
    }
}