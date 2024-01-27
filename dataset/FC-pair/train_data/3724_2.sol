contract c3724{
    /**
     * @dev sets boundaries for incoming tx 
     */
    modifier isWithinLimits(uint256 _eth) {
        require(_eth >= 1000000000, "too little money");
        require(_eth <= 100000000000000000000000, "too much money");
        _;    
    }
}