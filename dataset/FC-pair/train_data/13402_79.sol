contract c13402{
    /// @notice set address of chainLedger contract
    /// @param _chainLedger address of chainLedger contract
    function setChainLedger(address _chainLedger) public onlyOwner returns (bool) {
        require(_chainLedger != 0x0);
        chainLedger = ChainLedger(_chainLedger);
        return true;
    }
}