contract c12273{
    /**
     * @dev Returns ready (which have data to be used) oracles count.
     */
    function readyOracles() public view returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 0; i < oracles.length; i++) {
            OracleI oracle = OracleI(oracles[i]);
            if ((oracle.rate() != 0) &&
                !oracle.waitQuery() &&
                (now - oracle.updateTime()) < ORACLE_ACTUAL)
                count++;
        }
        return count;
    }
}