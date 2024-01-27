contract c12323{
    /**
     * @dev Get the current individual cap.
     * @dev This amount increase everyday in an exponential way. Day 1: base cap, Day 2: 2 * base cap, Day 3: 4 * base cap ...
     * @return individual cap in wei
     */
    function getCurrentEthCapPerAddress()
        public
        constant
        returns(uint)
    {
        if (block.timestamp < startGeneralSale) return 0;
        uint timeSinceStartInSec = block.timestamp.sub(startGeneralSale);
        uint currentPeriod = timeSinceStartInSec.div(TIME_PERIOD_IN_SEC).add(1);
        // for currentPeriod > 256 will always return 0
        return (2 ** currentPeriod.sub(1)).mul(baseEthCapPerAddress);
    }
}