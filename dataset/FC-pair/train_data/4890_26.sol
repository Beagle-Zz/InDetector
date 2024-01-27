contract c4890{
    /// @notice Sign out contract
    ///
    /// @param _contract contract's address
    function signOut(address _contract) external onlyContractOwner returns (uint) {
        require(_contract != 0x0);
        delete authorized[_contract];
        return OK;
    }
}