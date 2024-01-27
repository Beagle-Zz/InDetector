contract c12273{
    /**
     * @dev Returns wait query oracle count.
     */
    function waitingOracles() public view returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 0; i < oracles.length; i++) {
            if (OracleI(oracles[i]).waitQuery() && (now - requestTime) < ORACLE_TIMEOUT) {
                count++;
            }
        }
        return count;
    }
}