contract c8529{
    /**
        @dev registers a new address for the contract name in the registry
        @param _contractName     contract name
        @param _contractAddress  contract address
    */
    function registerAddress(bytes32 _contractName, address _contractAddress)
        public
        ownerOnly
        validAddress(_contractAddress)
    {
        require(_contractName.length > 0); // validate input
        // update the address in the registry
        items[_contractName].contractAddress = _contractAddress;
        if (!items[_contractName].isSet) {
            // mark the item as set
            items[_contractName].isSet = true;
            // add the contract name to the name list
            uint256 i = contractNames.push(bytes32ToString(_contractName));
            // update the item's index in the list
            items[_contractName].nameIndex = i - 1;
        }
        // dispatch the address update event
        emit AddressUpdate(_contractName, _contractAddress);
    }
}