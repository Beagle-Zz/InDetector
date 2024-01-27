contract c4147{
    ////////////////
    // Enable tokens transfers
    ////////////////
    /// @notice Enables token holders to transfer their tokens freely if true
    /// @param _transfersEnabled True if transfers are allowed in the clone
    function enableTransfers(bool _transfersEnabled) ownerOrController public {
        transfersEnabled = _transfersEnabled;
    }
}