contract c12680{
    //wait for game to start
    modifier isStarted {
        require(now >= disableTime);
        _;
    }
}