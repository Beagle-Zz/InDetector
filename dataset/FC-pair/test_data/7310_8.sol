contract c7310{
    /**** Contract Upgrade Methods ***********/
    /**
    * @dev Add a contract address to the contract storage, allowing it to access storage
    * @param _name Name of the contract to add
    * @param _newContractAddress Address of the contract to add
    */
    function addContract(string _name, address _newContractAddress) onlyOwner external {
        // Make sure the contract name isn't already in use.  If it is, upgradeContract() is the proper function to use
        address existing_ = rocketStorage.getAddress(keccak256("contract.name", _name));
        require(existing_ == 0x0);
        // Add the contract to the storage using a hash of the "contract.name" namespace and the name of the contract that was supplied as the 'key' and use the new contract address as the 'value'
        // This means we can get the address of the contract later by looking it up using its name eg 'rocketUser'
        rocketStorage.setAddress(keccak256("contract.name", _name), _newContractAddress);
        // Add the contract to the storage using a hash of the "contract.address" namespace and the address of the contract that was supplied as the 'key' and use the new contract address as the 'value'
        // This means we can verify this contract as belonging to the dApp by using it's address rather than its name.
        // Handy when you need to protect certain methods from being accessed by any contracts that are not part of the dApp using msg.sender (see the modifier onlyLatestRocketNetworkContract() in the RocketStorage code)
        rocketStorage.setAddress(keccak256("contract.address", _newContractAddress), _newContractAddress);
        // Log it
        emit ContractAdded(_newContractAddress, now);
    }
}