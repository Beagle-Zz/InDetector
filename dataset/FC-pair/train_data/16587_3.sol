contract c16587{
    // called by the owner , resumes ICO
    function releaseICO() external onlyOwner atStage(Stages.PAUSED)
    {
        stopped = false;
        stage = Stages.ICO;
    }
}