contract c2441{
    /**
     * @dev add single address to whitelist
     */
    function addAddressToWhitelist(address _address) external onlyOwner {
        whitelist[_address] = true;
        emit WhitelistedAddressAdded(_address);
    }
}