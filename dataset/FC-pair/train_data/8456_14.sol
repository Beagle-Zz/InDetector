contract c8456{
    // Finished ICO
    modifier ICOFinished {
        require(icoState == IcoState.Finished);
        _;
    }
}