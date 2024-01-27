contract c14735{
    /// @notice Disable all transfers in case of a vulnerability found in the contract or other systems.
    /// @dev Disable transfers in BXN contract.
    function disableTransfers() external onlyOwner {
        require(transfersEnabled);
        transfersEnabled = false;
        DisableTransfers(msg.sender);
    }
}