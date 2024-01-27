contract c10953{
    /*
        @dev allows the owner to update the contract registry contract address
        @param _registry   address of a contract registry contract
    */
    function setContractRegistry(IContractRegistry _registry) public ownerOnly {
        registry = _registry;
    }
}