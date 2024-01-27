contract c8450{
    // Finished ICO
    modifier ICOFinished {
        require(icoState == IcoState.Finished);
        _;
    }
}