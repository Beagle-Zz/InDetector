contract c18303{
    // Allocate tokens for team vested gradually for 1 year
    function allocateTokensForTeam() external isActive onlyOwnerOrAdmin {
        require(saleState == END_SALE);
        require(teamAddress != address(0));
        uint256 amount;
        if (teamAllocatedTime == 1) {
            amount = teamAllocation * 20/100;
            balances[teamAddress] = balances[teamAddress].add(amount);
            emit AllocateTokensForTeam(teamAddress, teamAllocatedTime, amount);
            teamAllocatedTime = 2;
            return;
        }
        if (teamAllocatedTime == 2) {
            require(now >= icoEndTime + lockPeriod1);
            amount = teamAllocation * 30/100;
            balances[teamAddress] = balances[teamAddress].add(amount);
            emit AllocateTokensForTeam(teamAddress, teamAllocatedTime, amount);
            teamAllocatedTime = 3;
            return;
        }
        if (teamAllocatedTime == 3) {
            require(now >= icoEndTime + lockPeriod2);
            amount = teamAllocation * 50/100;
            balances[teamAddress] = balances[teamAddress].add(amount);
            emit AllocateTokensForTeam(teamAddress, teamAllocatedTime, amount);
            teamAllocatedTime = 4;
            return;
        }
        revert();
    }
}