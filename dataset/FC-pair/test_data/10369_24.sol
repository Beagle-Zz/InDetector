contract c10369{
    //Current Vesting stage for Musk team 
    function teamVestingStage() public view onlyTeamReserve returns(uint256){
        // Every 3 months
        uint256 vestingMonths = teamTimeLock.div(teamVestingStages); 
        uint256 stage = (block.timestamp.sub(lockedAt)).div(vestingMonths);
        //Ensures team vesting stage doesn't go past teamVestingStages
        if(stage > teamVestingStages){
            stage = teamVestingStages;
        }
        return stage;
    }
}