contract c18688{
    /**
     * @dev     Set the payouts manually, in case of a failed Oraclize call.
     *          Only callable by the Etheraffle address.
     *
     * @param _week         The week number of the raffle to set the payouts for.
     * @param _numMatches   Number of matches. Comma-separated STRING of 4
     *                      integers long, consisting of the number of 3 match
     *                      winners, 4 match winners, 5 & 6 match winners in
     *                      that order.
     */
    function setPayouts(uint _week, string _numMatches) onlyEtheraffle external {
        setPayOuts(_week, _numMatches);
    }
}