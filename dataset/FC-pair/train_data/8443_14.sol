contract c8443{
    // Finished ICO
    modifier ICOFinished {
        require(icoState == IcoState.Finished);
        _;
    }
}