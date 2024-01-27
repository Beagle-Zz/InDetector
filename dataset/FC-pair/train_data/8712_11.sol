contract c8712{
    /*
    * Helper function
    *
    */
    function getBancorContractAddress() public view returns(address) {
        return bancorRegistry.getAddress(BANCOR_NETWORK);
    }
}