contract c23{
    /*
     * Remove users from whitelist
     *
     * @param users: Addresses of users who should not belong to whitelist
     */
    function removeFromWhitelist(address user) public onlyOwner {
        whitelist[user] = false;
    }
}