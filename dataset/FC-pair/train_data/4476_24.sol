contract c4476{
    /**
    * @notice Returns price and corresponding update time
    * @return latest POLYUSD price
    * @return timestamp of latest price update
    */
    function getPriceAndTime() view public returns(uint256, uint256) {
        return (POLYUSD, latestUpdate);
    }
}