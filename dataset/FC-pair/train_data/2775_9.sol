contract c2775{
    /**
     * Allows for the maximum number of participants to be queried. This is a constant function 
     * which does not alter the state of the contract and therefore does not require any gas or a
     * signature to be executed. 
     * 
     * @return the maximum number of recipients per transaction.
     * */
    function getMaxDropsPerTx() public view returns(uint256) {
        return maxDropsPerTx;
    }
}