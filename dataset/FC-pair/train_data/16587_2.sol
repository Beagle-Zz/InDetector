contract c16587{
    // called by the owner, pause ICO
    function PauseICO() external onlyOwner atStage(Stages.ICO) {
        stopped = true;
        stage = Stages.PAUSED;
    }
}