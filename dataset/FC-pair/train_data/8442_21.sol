contract c8442{
    // manual pause ico
    function pauseIco() external onlyOwner {
        require(icoState == IcoState.Running);
        icoState = IcoState.Paused;
        PauseIco();
    }
}