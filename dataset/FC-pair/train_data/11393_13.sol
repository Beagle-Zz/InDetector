contract c11393{
    /*
        @dev allows the owner to update the contract registry contract address
        @param _registry   address of a contract registry contract
    */
    function setContractRegistry(IContractRegistry _registry)
        public
        ownerOnly
        validAddress(_registry)
        notThis(_registry)
    {
        registry = _registry;
    }
}