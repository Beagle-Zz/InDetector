contract c40078{
     
    modifier isNotRegistered(bytes12 contractId) {
        if (contractAddresses[contractId] != 0) {
            throw;
        }
        _;
    }
}