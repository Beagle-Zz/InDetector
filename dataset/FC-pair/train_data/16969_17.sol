contract c16969{
  /**
     * @dev Internal function that is used to determine the current rate for token / ETH conversion
     * @return The current token rate
     */
    function getRate() internal view returns (uint256) {
        if(now < (startTime + 5 weeks)) {
            return 7000;
        }
        if(now < (startTime + 9 weeks)) {
            return 6500;
        }
        if(now < (startTime + 13 weeks)) {
            return 6000;
        }
        if(now < (startTime + 15 weeks)) {
            return 5500;
        }
        return 5000;
    }
}