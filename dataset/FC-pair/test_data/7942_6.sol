contract c7942{
    /// @dev set a new contract for recieve the tokens (for update contract)
    function setMigrateContract(address _newContractAddr) isOwner external {
        require (_newContractAddr != newContractAddr);
        newContractAddr = _newContractAddr;
    }
}