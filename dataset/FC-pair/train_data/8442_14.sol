contract c8442{
    // Finished ICO
    modifier ICOFinished {
        require(icoState == IcoState.Finished);
        _;
    }
}