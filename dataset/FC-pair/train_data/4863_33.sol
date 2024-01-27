contract c4863{
    /// @notice Return pending manager address
    ///
    /// @return code
    function getPendingManager() public view returns (address) {
        return pendingManager;
    }
}