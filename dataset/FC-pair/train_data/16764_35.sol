contract c16764{
    /*
     * Add users to whitelist
     * Whitelisted users are accumulated on each round
     *
     * @param users: Addresses of users who passed KYC
     */
    function addManyToWhitelist(address[] users) external onlyOwner {
        for (uint32 i = 0; i < users.length; i++) {
            addToWhitelist(users[i]);
        }
    }
}