contract c8451{
    /**
     * @dev Add/Remove to whitelist array of addresses based on boolean status
     */
    function updateWhitelist(address[] addresses, bool status) public onlyOwner {
        for (uint256 i = 0; i < addresses.length; i++) {
            address contributorAddress = addresses[i];
            whitelist[contributorAddress] = status;
            emit WhitelistUpdate(contributorAddress, status);
        }
    }
}