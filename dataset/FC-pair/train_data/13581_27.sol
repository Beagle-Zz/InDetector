contract c13581{
    /**
     * @dev Token Contract Modifier
     * @param _to - Address to check if valid
     *
     *  Check if an address is valid
     *  A valid address is as follows,
     *    1. Not zero address
     *    2. Not token address
     *
     */
    modifier isValidDestination(address _to) {
        require(_to != address(0x0));
        require(_to != address(this));
        _;
    }
}