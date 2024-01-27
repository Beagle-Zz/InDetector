contract c40081{
     
    function register(bytes12 contractId) external isNotRegistered(contractId) {
         
        contractAddresses[contractId] = msg.sender;
         
        Register(contractId, msg.sender);
    }
}