contract c4898{
    /// @notice Update access manager address
    ///
    /// @param _accessManager access manager's address
    function setAccessManager(address _accessManager) external onlyContractOwner returns (uint) {
        require(_accessManager != 0x0);
        accessManager = _accessManager;
        return OK;
    }
}