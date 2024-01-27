contract c4898{
    /// @notice Sign in contract
    ///
    /// @param _contract contract's address
    function signIn(address _contract) external onlyContractOwner returns (uint) {
        require(_contract != 0x0);
        authorized[_contract] = true;
        return OK;
    }
}