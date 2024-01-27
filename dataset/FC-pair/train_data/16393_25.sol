contract c16393{
    // whichPeriod returns the vesting period we are in 
    // 0 - before start or not eligible
    // 1 - n : the timeperiod we are in
    function whichPeriod(address whom, uint time) public view returns (uint period) {
        VestingSchedule memory v = vestingSchedules[whom];
        if (started && (v.tokens > 0) && (time >= v.startTime)) {
            period = Math.min256(1 + (time - v.startTime) / v.lockPeriod,v.numPeriods);
        }
    }
}