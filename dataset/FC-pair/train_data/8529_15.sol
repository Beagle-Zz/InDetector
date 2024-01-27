contract c8529{
    // deprecated, backward compatibility
    function getAddress(bytes32 _contractName) public view returns (address) {
        return addressOf(_contractName);
    }
}