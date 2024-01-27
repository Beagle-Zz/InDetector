contract c16921{
    /// @dev Aimed to mark the smart contract as upgraded if there is a crucial
    ///  bug. This keeps track of the new contract and indicates that the new address is set. 
    /// Updating to the new contract address is up to the clients. (This contract will
    ///  be paused indefinitely if such an upgrade takes place.)
    /// @param _newAddress new address
    function setUpgradedAddress(address _newAddress) public onlyOwner whenPaused
    {
        require(_newAddress != address(0));
        upgradedContractAddress = _newAddress;
        emit ContractUpgrade(upgradedContractAddress);
    }
}