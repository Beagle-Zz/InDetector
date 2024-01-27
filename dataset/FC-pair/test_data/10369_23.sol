contract c10369{
    //Claim tokens for Musk team reserve wallet
    function claimTeamReserve() onlyTeamReserve locked public {
        uint256 vestingStage = teamVestingStage();
        //Amount of tokens the team should have at this vesting stage
        uint256 totalUnlocked = vestingStage.mul(allocations[teamReserveWallet]).div(teamVestingStages);
        require(totalUnlocked <= allocations[teamReserveWallet]);
        //Previously claimed tokens must be less than what is unlocked
        require(claimed[teamReserveWallet] < totalUnlocked);
        uint256 payment = totalUnlocked.sub(claimed[teamReserveWallet]);
        claimed[teamReserveWallet] = totalUnlocked;
        require(token.transfer(teamReserveWallet, payment));
        Distributed(teamReserveWallet, payment);
    }
}