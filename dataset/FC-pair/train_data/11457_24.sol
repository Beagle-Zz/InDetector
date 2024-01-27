contract c11457{
    // Claim tokens for team reserve wallet
    function claimTeamReserve() onlyTeamReserve locked public {
        address reserveWallet = msg.sender;
        // Can't claim before Lock ends
        require(block.timestamp > timeLocks[reserveWallet]);
        uint256 vestingStage = teamVestingStage();
        // Amount of tokens the team should have at this vesting stage
        uint256 totalUnlocked = vestingStage.mul(7.2 * (10 ** 6) * (10 ** 8));
        // For the last vesting stage, we will release all tokens
        if (vestingStage == 34) {
          totalUnlocked = allocations[teamReserveWallet];
        }
        // Total unlocked token must be smaller or equal to total locked token
        require(totalUnlocked <= allocations[teamReserveWallet]);
        // Previously claimed tokens must be less than what is unlocked
        require(claimed[teamReserveWallet] < totalUnlocked);
        // Number of tokens we can get
        uint256 payment = totalUnlocked.sub(claimed[teamReserveWallet]);
        // Update the claimed tokens in team wallet
        claimed[teamReserveWallet] = totalUnlocked;
        // Transfer to team wallet address
        require(token.transfer(teamReserveWallet, payment));
        Distributed(teamReserveWallet, payment);
    }
}