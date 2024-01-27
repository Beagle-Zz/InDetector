contract c13186{
    /**
     * Throws if called by any account other than the owner.
    **/
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}