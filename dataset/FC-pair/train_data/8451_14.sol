contract c8451{
    /**
     * @dev Check that address is exist in whitelist
     */
    function isWhitelisted(address contributor) public constant returns (bool) {
        return whitelist[contributor];
    }
}