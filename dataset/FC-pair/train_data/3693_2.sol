contract c3693{
    // Allows the owner to suspend the sale until it is manually resumed at a later time.
    function suspend() external onlyOwner returns(bool) {
        if (suspended == true) {
            return false;
        }
        suspended = true;
        SaleSuspended();
        return true;
    }
}