contract c10312{
    /**
     * @dev modifier to limit the number of times a function can be called to once. 
     */
    modifier onlyOnce(){
        require(functAttempts <= 0);
        _;
    }
}