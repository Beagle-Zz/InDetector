contract c40082{
     
    modifier isRegistered(bytes12 contractId) {
        if (contractAddresses[contractId] == 0) {
            throw;
        }
        _;
    }
}