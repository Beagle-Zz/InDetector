contract c16664{
    // ------------------------------------------------------------------------
    // resume the ICO
    // ------------------------------------------------------------------------
    function resumeICO() onlyOwner public {
        isStopped = false;
    }
}