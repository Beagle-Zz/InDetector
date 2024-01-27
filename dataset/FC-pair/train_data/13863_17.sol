contract c13863{
    //Has not been locked yet
    modifier notLocked {
        require(lockedAt == 0);
        _;
    }
}