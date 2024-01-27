contract c8529{
    /**
        @dev returns the address associated with the given contract name
        @param _contractName    contract name
        @return contract address
    */
    function addressOf(bytes32 _contractName) public view returns (address) {
        return items[_contractName].contractAddress;
    }
}