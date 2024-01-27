contract c1911{
    /// @notice Sets new wallet address for profiterole
    /// Only for contract owner.
    function updateWallet(address _wallet) external onlyContractOwner returns (uint) {
        require(_wallet != 0x0);
        wallet = _wallet;
        return OK;
    }
}