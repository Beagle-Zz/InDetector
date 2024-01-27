contract c4890{
    /**
     * Sets asset proxy address.
     *
     * Can be set only once.
     *
     * @param _proxy asset proxy contract address.
     *
     * @return success.
     * @dev function is final, and must not be overridden.
     */
    function init(address _proxy) public returns (bool) {
        if (address(proxy) != 0x0) {
            return false;
        }
        proxy = _proxy;
        return true;
    }
}