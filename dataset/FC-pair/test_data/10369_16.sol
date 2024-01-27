contract c10369{
    //Has not been locked yet
    modifier notLocked {
        require(lockedAt == 0);
        _;
    }
}