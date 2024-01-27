contract c1420{
    /**
     * @dev `owner` is the only address that can call a function with this
     * modifier
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}