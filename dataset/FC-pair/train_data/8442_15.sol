contract c8442{
    // Failed ICO - time is over 
    modifier ICOFailed {
        require(now >= (endTime));
        require(icoState == IcoState.Failed || !isSuccess);
        _;
    }
}