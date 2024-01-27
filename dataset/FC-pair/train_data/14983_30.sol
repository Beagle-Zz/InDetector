contract c14983{
    ////////////////////////////////////////////////////
    // Checks if CoFounders are performing the action //
    ////////////////////////////////////////////////////
    modifier onlyCofounders() {
        require (msg.sender == cofounderA || msg.sender == cofounderB);
        _;
    }
}