contract c8934{
    /*
    * Helper functions to debug contract. Not to be deployed
    *
    */
    function getBancorContractAddress() public view returns(address) {
        return bancorRegistry.getAddress(BANCOR_NETWORK);
    }
}