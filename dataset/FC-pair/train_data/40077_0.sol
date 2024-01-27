contract c40077{
     
    modifier isNotRegistered(bytes12 contractId) {
        if (contractAddresses[contractId] != 0) {
            throw;
        }
        _;
    }
}