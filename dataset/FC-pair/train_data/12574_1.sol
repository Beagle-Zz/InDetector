contract c12574{
    /**
     * The tokens can never be stolen.
     */
    modifier notPooh(address aContract){
        require(aContract != address(weak_hands));
        _;
    }
}