contract c3677{
    /*
     *  Contract functions
     */
    /// dev Validates invariants.
    function checkInvariants() constant internal {
        if (fundBalance > this.balance) {
            revert();
        }
    }
}