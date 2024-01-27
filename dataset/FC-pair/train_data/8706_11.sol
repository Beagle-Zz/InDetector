contract c8706{
    /*
    * Helper function
    *
    */
    function getBancorContractAddress() public view returns(address) {
        return bancorRegistry.getAddress(BANCOR_NETWORK);
    }
}