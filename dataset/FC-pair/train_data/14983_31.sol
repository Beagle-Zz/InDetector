contract c14983{
    ////////////////////////////////////////////////////
    // Checks if CoFounder A is performing the action //
    ////////////////////////////////////////////////////
    modifier onlyCofounderA() {
        require (msg.sender == cofounderA);
        _;
    }
}