contract c12273{
    /**
     * @dev Returns contract oracles' count.
     */
    function oracleCount() public view returns(uint256) {
        return oracles.length;
    }
}