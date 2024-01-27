contract c2289{
    /**
     * get current round details
     */
    function currentRound() public view returns (uint round, uint counter, uint round_users, uint price) {
        return (_round, _counter, QMAX, PRICE_WEI);
    }
}