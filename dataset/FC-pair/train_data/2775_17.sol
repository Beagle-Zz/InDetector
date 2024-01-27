contract c2775{
    /**
     * Allows for the total ETH balance of an address to be queried. This is a constant
     * function which does not alter the state of the contract and therefore does not  
     * require any gas or a signature to be executed. 
     * 
     * @param _addr The address of which to query the total ETH balance. 
     * 
     * @return The total amount of ETH balance the address has.
     * */
    function getEthBalanceOf(address _addr) public view returns(uint256) {
        return ethBalanceOf[_addr];
    }
}