contract c11457{
    //Current Vesting stage for team
    function teamVestingStage() public view onlyTeamReserve returns(uint256) {
        uint256 nowTime = block.timestamp;
        // Number of months past our unlock time, which is the stage
        uint256 stage = (nowTime.sub(teamReserveTimeLock)).div(2592000);
        // Ensures team vesting stage doesn't go past teamVestingStages
        if(stage > teamVestingStages) {
            stage = teamVestingStages;
        }
        return stage;
    }
}