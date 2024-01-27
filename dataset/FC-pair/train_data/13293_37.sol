contract c13293{
    /**
     * @dev Every quarter release, 25% of token to the founders
     */
    function releaseFounderTokens() external onlyOwner returns (bool) {
        if (quarterFirst && block.timestamp >= (openingTime.add(10 weeks))) {
            quarterFirst = false;
            token.transfer(_founder_one, QUARTERLY_RELEASE);
            token.transfer(_founder_two, QUARTERLY_RELEASE);
            allocated[_founder_one] = allocated[_founder_one].sub(QUARTERLY_RELEASE);
            allocated[_founder_two] = allocated[_founder_two].sub(QUARTERLY_RELEASE);
            totalAllocated = totalAllocated.sub(QUARTERLY_RELEASE);
            totalAllocated = totalAllocated.sub(QUARTERLY_RELEASE);
        }
        if (quarterSecond && block.timestamp >= (openingTime.add(22 weeks))) {
            quarterSecond = false;
            token.transfer(_founder_one, QUARTERLY_RELEASE);
            token.transfer(_founder_two, QUARTERLY_RELEASE);
            allocated[_founder_one] = allocated[_founder_one].sub(QUARTERLY_RELEASE);
            allocated[_founder_two] = allocated[_founder_two].sub(QUARTERLY_RELEASE);
            totalAllocated = totalAllocated.sub(QUARTERLY_RELEASE);
            totalAllocated = totalAllocated.sub(QUARTERLY_RELEASE);
        }
        if (quarterThird && block.timestamp >= (openingTime.add(34 weeks))) {
            quarterThird = false;
            token.transfer(_founder_one, QUARTERLY_RELEASE);
            token.transfer(_founder_two, QUARTERLY_RELEASE);
            allocated[_founder_one] = allocated[_founder_one].sub(QUARTERLY_RELEASE);
            allocated[_founder_two] = allocated[_founder_two].sub(QUARTERLY_RELEASE);
            totalAllocated = totalAllocated.sub(QUARTERLY_RELEASE);
            totalAllocated = totalAllocated.sub(QUARTERLY_RELEASE);
        }
        if (quarterFourth && block.timestamp >= (openingTime.add(46 weeks))) {
            quarterFourth = false;
            token.transfer(_founder_one, QUARTERLY_RELEASE);
            token.transfer(_founder_two, QUARTERLY_RELEASE);
            allocated[_founder_one] = allocated[_founder_one].sub(QUARTERLY_RELEASE);
            allocated[_founder_two] = allocated[_founder_two].sub(QUARTERLY_RELEASE);
            totalAllocated = totalAllocated.sub(QUARTERLY_RELEASE);
            totalAllocated = totalAllocated.sub(QUARTERLY_RELEASE);
        }
        return true;
    }
}