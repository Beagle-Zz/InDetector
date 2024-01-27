contract c2995{
    /**
     * @dev prevents contracts from interacting with ratscam 
     */
    modifier isHuman() {
        require(msg.sender == tx.origin);
        _;
    }
}