contract c1419{
    /**
     * @dev `owner` is the only address that can call a function with this
     * modifier
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}