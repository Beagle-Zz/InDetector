contract c8372{
    // vault finalization task, called when owner calls finalize()
    function finalization() internal {
        if (!goalReached()) {
            vault.enableRefunds(); 
        } 
        super.finalization();
    }
}