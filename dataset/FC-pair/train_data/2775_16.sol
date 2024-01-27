contract c2775{
    /**
     * Allows for the total credit (bonus + non-bonus) of an address to be queried. This is a 
     * constant function which does not alter the state of the contract and therefore does not  
     * require any gas or a signature to be executed. 
     * 
     * @param _addr The address of which to query the total credits. 
     * 
     * @return The total amount of credit the address has (bonus + non-bonus credit).
     * */
    function getTotalDropsOf(address _addr) public view returns(uint256) {
        return getDropsOf(_addr).add(getBonusDropsOf(_addr));
    }
}