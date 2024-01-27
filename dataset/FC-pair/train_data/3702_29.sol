contract c3702{
    /**
    * @dev  After one month, the amount will be 1, which means 10% of the coins can be used. 
    * After 7 months, 70% of the amount can be used.
    */
    function getLimitPeriod() external view returns (uint256) {
        uint256 presentTime = block.timestamp;
        uint256 timeValue = presentTime.sub(openingTime);
        uint256 result = timeValue.div(31 days);
        return result;
    }
}