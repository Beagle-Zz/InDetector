contract c13581{
    /**
    * @dev   Token Contract Modifier
    * Check if valid address
    *
    * @param _addr - The address to check
    *
    */
    modifier validAddress(address _addr) {
        require(_addr != address(0x0));
        require(_addr != address(this));
        _;
    }
}