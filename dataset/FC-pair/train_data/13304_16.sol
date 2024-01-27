contract c13304{
    // Returns the percentage of the bonus on the current date. Constant.
    function getProfitPercent() public constant returns (uint256){
        return getProfitPercentForData(now);
    }
}