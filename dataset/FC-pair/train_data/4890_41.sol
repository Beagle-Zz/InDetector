contract c4890{
    /// @notice Return pending manager address
    ///
    /// @return code
    function getPendingManager() public view returns (address) {
        return pendingManager;
    }
}