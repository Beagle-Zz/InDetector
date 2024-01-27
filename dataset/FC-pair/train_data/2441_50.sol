contract c2441{
    /**
     * @dev throws if buyer is not whitelisted.
     * @param _buyer address
     */
    modifier onlyIfWhitelisted(address _buyer) {
        require(whitelist[_buyer]);
        _;
    }
}