contract c3329{
    // descending rate
    function getCurrentRate() public view returns (uint256) {
        uint256 time = now;
        if (time <= salePeriods[0]) {
            return 4031;
        }
        if (time <= salePeriods[1]) {
            return 3794;
        }
        if (time <= salePeriods[2]) {
            return 3583;
        }
        if (time <= salePeriods[3]) {
            return 3395;
        }
        if (time <= salePeriods[4]) {
            return 3225;
        }
        return rate;
    }
}