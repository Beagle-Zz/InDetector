contract c23{
    /*
     * Remove users from whitelist
     *
     * @param users: Addresses of users who should not belong to whitelist
     */
    function removeManyFromWhitelist(address[] users) external onlyOwner {
        for (uint32 i = 0; i < users.length; i++) {
            removeFromWhitelist(users[i]);
        }
    }
}