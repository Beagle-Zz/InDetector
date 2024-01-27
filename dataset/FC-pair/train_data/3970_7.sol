contract c3970{
    /// @dev set a new contract for recieve the tokens (for update contract)
    function setMigrateContract(address _newContractAddr) isOwner external {
        if (_newContractAddr == newContractAddr) throw;
        newContractAddr = _newContractAddr;
    }
}