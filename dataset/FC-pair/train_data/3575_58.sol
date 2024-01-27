contract c3575{
    /**
     * @dev Access control modifier that allows only whitelisted address to call the method.
     */
    modifier onlyWhitelisted(address _address) {
        require(whitelist.whitelisted(_address));
        _;
    }
}