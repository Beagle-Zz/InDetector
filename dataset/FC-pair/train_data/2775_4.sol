contract c2775{
    /**
     * Any function with this modifier in its method signature can only be executed by
     * the owner of the contract. Any attempt made by any other account to invoke the 
     * functions with this modifier will result in a loss of gas and the contract's state
     * will remain untampered.
     * */
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}