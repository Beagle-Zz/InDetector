contract c3729{
    /**
    * @dev Check the latest limit
    * @param who Check the latest limit. 
    * Return the limit value of the user at the present moment. After 3 months, _result value will be 30% of initialAmount 
    */
    function _timelimitCal(address who) internal view returns (uint256) {
        uint256 presentTime = block.timestamp;
        uint256 timeValue = presentTime.sub(openingTime);
        uint256 _result = timeValue.div(31 days);
        return _result.mul(searchInvestor[who]._limit);
    }
}