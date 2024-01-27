contract c4900{
    /// @notice Return pending manager address
    ///
    /// @return code
    function getPendingManager() public view returns (address) {
        return pendingManager;
    }
}