contract c40082{
     
    modifier isNotRegistered(bytes12 contractId) {
        if (contractAddresses[contractId] != 0) {
            throw;
        }
        _;
    }
}