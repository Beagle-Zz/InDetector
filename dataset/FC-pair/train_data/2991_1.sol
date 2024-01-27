contract c2991{
    /**
     * @dev prevents contracts from interacting with fomo3d 
     */
    modifier isHuman() {
        require(msg.sender == tx.origin, "sorry humans only");
        _;
    }
}