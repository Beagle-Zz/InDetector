contract c16118{
    /*
     * checks payouts are currently active
    */
    modifier payoutsAreActive {
        if (payoutsPaused == true) throw;
        _;
    }
}