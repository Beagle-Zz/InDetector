contract c13442{
    // Compute sell price for 1 cookie, it is 0.5 when a new token contract is deployed,
    // and then goes up until it reaches the maximum sell price after 5 days.
    function computeSellPrice() public view returns (uint) {
        uint256 supply = totalSupply();
        if (supply == 0) {
            return 0;
        }
        uint index;
        uint lastTokenContractStartTime = now;
        while (index < tokenContractStartTime.length && tokenContractStartTime[index] < now) {
            lastTokenContractStartTime = tokenContractStartTime[index];
            index++;
        }
        if (now < lastTokenContractStartTime + 1 hours) {
            return 0;
        }
        uint timeToMaxValue = 5 days;
        uint256 secondsPassed = now - lastTokenContractStartTime;
        secondsPassed = secondsPassed <= timeToMaxValue ? secondsPassed : timeToMaxValue;
        uint256 multiplier = 5000 + 5000 * secondsPassed / timeToMaxValue;
        return 1 ether * address(this).balance / supply * multiplier / 10000;
    }
}