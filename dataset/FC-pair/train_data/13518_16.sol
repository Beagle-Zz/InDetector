contract c13518{
    //Has not been locked yet
    modifier notLocked {
        require(lockedAt == 0);
        _;
    }
}