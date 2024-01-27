contract c2775{
    /**
     * Allows for the bonus credit of an address to be queried. This is a constant function 
     * which does not alter the state of the contract and therefore does not require any gas 
     * or a signature to be executed. 
     * 
     * @param _addr The address of which to query the bonus credits. 
     * 
     * @return The total amount of bonus credit the address has (minus non-bonus credit).
     * */
    function getBonusDropsOf(address _addr) public view returns(uint256) {
        return bonusDropsOf[_addr];
    }
}