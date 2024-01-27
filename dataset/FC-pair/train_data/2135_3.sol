contract c2135{
    /**
     *
     * @dev get user subscription round number details
     *
     * @param user the specific user
     *
     * @param index the round number
     *
     * @return round no, user placing, user drop, user reward
     */
    function userRound(address user, uint index) public view returns (uint round, uint place, uint value, uint price) {
        history memory h = _history[user];
        return (h.rounds[index], h.places[index], h.values[index], h.prices[index]);
    }
}