contract c18688{
    /*
     * @dev     Returns a single payout when calculated using the splits method.
     *
     * @param _numWinners       Number of X match winners
     * @param _matchesIndex     Index of matches array (∴ 3 match win, 4 match win etc)
     */
    function splitsSingle(uint _numWinners, uint _matchesIndex) internal view returns (uint) {
        return (prizePool * pctOfPool[_matchesIndex]) / (_numWinners * 1000);
    }
}