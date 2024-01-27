contract c7960{
    /**
     * @dev Allows a function to be called only by the minter
     */
    modifier onlyMinter() {
        require(msg.sender == minter);
        _;
    }
}