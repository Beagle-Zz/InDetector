contract c2134{
    /**
     *
     * @dev get the total number of user subscriptions
     *
     * @param user the specific user
     *
     * @return user rounds size
     */
    function userRounds(address user) public view returns (uint) {
        return _history[user].size;
    }
}