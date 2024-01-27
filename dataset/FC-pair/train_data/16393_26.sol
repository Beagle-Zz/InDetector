contract c16393{
    // Returns the amount of tokens you can withdraw
    function vested(address beneficiary) public view returns (uint _amountVested) {
        VestingSchedule memory _vestingSchedule = vestingSchedules[beneficiary];
        // If it's past the end time, the whole amount is available.
        if ((_vestingSchedule.tokens == 0) || (_vestingSchedule.numPeriods == 0) || (now < _vestingSchedule.startTime)){
            return 0;
        }
        uint _end = _vestingSchedule.lockPeriod.mul(_vestingSchedule.numPeriods);
        if (now >= _vestingSchedule.startTime.add(_end)) {
            return _vestingSchedule.tokens;
        }
        uint period = now.sub(_vestingSchedule.startTime).div(_vestingSchedule.lockPeriod)+1;
        if (period >= _vestingSchedule.numPeriods) {
            return _vestingSchedule.tokens;
        }
        uint _lockAmount = _vestingSchedule.tokens.div(_vestingSchedule.numPeriods);
        uint vestedAmount = period.mul(_lockAmount);
        return vestedAmount;
    }
}