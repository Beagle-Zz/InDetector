contract c2782{
    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Invalid owner");
        _;
    }
}