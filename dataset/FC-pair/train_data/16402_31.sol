contract c16402{
    // vault finalization task, called when owner calls finalize()
    function finalization() internal {
        if (goalReached()) {
            vault_releaseDeposit();
        } else {
            vault_enableRefunds();
        }
    }
}