contract c7441{
    /**
     * @dev remove single address from whitelist
     */
    function removeAddressFromWhitelist(address _address) external onlyOwner {
        delete whitelist[_address];
        emit WhitelistedAddressRemoved(_address);
    }
}