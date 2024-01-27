contract c2289{
    /**
     *
     * @dev blacklist a user for its comments behavior
     *
     * @param user address
     *
     */
    function blackList(address user) public onlyOwner {
        history storage h = _history[user];
        if (h.size > 0) {
            h.blacklist = FLAG_BLACKLIST;
        }
    }
}