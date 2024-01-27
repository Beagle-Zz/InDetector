contract c4888{
    /* EXTERNAL */
    /// @notice Sets new treasury address
    /// Only for contract owner.
    function updateTreasury(address _treasury) external onlyContractOwner returns (uint) {
        require(_treasury != 0x0);
        treasury = _treasury;
        return OK;
    }
}