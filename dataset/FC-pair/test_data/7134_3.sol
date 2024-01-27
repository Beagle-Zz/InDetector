contract c7134{
    // This function can be used by owner in emergency to update running status parameter
    function fixSpecications(bool RunningStatusICO) external onlyOwner
    {
        icoRunningStatus = RunningStatusICO;
    }
}