contract c10993{
    /**
     * modifier for some action only owner can do
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}