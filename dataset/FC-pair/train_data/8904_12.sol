contract c8904{
    /**
        @dev removes an existing contract address from the registry
       @param _contractName contract name
    */
    function unregisterAddress(bytes32 _contractName) public ownerOnly {
        require(_contractName.length > 0); // validate input
        // remove the address from the registry
        items[_contractName].contractAddress = address(0);
        if (items[_contractName].isSet) {
            // mark the item as empty
            items[_contractName].isSet = false;
            // move the last element to the deleted element's position
            names[items[_contractName].nameIndex] = names[names.length - 1];
            // remove the last element from the name list
            names.length--;
            // zero the deleted element's index
            items[_contractName].nameIndex = 0;
        }
        // dispatch the address update event
        emit AddressUpdate(_contractName, address(0));
    }
}