contract c7044{
    /**
     * @dev Disable whitelisting
     */
    function disableWhitelist() public onlyOwner {
        whitelistEnabled = false;
    }
}