contract c12677{
    /// @dev Modifier, which only allows to set valid transfer timeouts.
    modifier onlyValidTransferTimeSpan(uint transferTimeout) {
        require(transferTimeout >= MIN_TRANSFER_TIMESPAN
                && transferTimeout <= MAX_TRANSFER_TIMSPAN);
        _;
    }
}