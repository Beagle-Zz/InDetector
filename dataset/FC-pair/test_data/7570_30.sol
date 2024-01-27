contract c7570{
    /**
    * @dev Calculates the token amount per ETH contributed based on the time now.
    * @return Rate of amount of GSTAR per Ether as of current time.
    */
    function getRate() public view returns (uint256) {
        //calculate bonus based on timing
        if (block.timestamp <= startTime) { return ((rate / 100) * 120); } // 20 percent bonus on presale period, returns 12000
        if (block.timestamp <= startTime.add(1 days)) {return ((rate / 100) * 108);} // 8 percent bonus on day one, return 10800
        return rate;
    }
}