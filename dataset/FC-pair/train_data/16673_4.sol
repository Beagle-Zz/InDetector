contract c16673{
    //--------------------------------------------------------------------------
    // ICO/Pot share functions
    //--------------------------------------------------------------------------
    function ReleaseICO() external
    {
        require(miners[msg.sender].lastUpdateTime != 0);
        require(nextPotDistributionTime <= block.timestamp);
        require(honeyPotAmount > 0);
        require(globalICOPerCycle[cycleCount] > 0);
        nextPotDistributionTime = block.timestamp + 86400;
        honeyPotPerCycle[cycleCount] = honeyPotAmount / 5; // 20% of the pot
        honeyPotAmount -= honeyPotAmount / 5;
        honeyPotPerCycle.push(0);
        globalICOPerCycle.push(0);
        cycleCount = cycleCount + 1;
        MinerData storage jakpotWinner = miners[msg.sender];
        jakpotWinner.unclaimedPot += jackPot;
        jackPot = 0;
    }
}