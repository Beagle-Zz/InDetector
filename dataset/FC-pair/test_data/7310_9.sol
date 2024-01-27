contract c7310{
    /// @param _name The name of an existing contract in the network
    /// @param _upgradedContractAddress The new contracts address that will replace the current one
    // TODO: Write unit tests to verify
    function upgradeContract(string _name, address _upgradedContractAddress) onlyOwner external {
        // Get the current contracts address
        address oldContractAddress = rocketStorage.getAddress(keccak256("contract.name", _name));
        // Check it exists
        require(oldContractAddress != 0x0);
        // Check it is not the contract's current address
        require(oldContractAddress != _upgradedContractAddress);
        // Replace the address for the name lookup - contract addresses can be looked up by their name or verified by a reverse address lookup
        rocketStorage.setAddress(keccak256("contract.name", _name), _upgradedContractAddress);
        // Add the new contract address for a direct verification using the address (used in RocketStorage to verify its a legit contract using only the msg.sender)
        rocketStorage.setAddress(keccak256("contract.address", _upgradedContractAddress), _upgradedContractAddress);
        // Remove the old contract address verification
        rocketStorage.deleteAddress(keccak256("contract.address", oldContractAddress));
        // Log it
        emit ContractUpgraded(oldContractAddress, _upgradedContractAddress, now);
    }
}