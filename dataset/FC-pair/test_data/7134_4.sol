contract c7134{
    // function to remove locking period after 12 months, can be called only be owner
    function removeLocking(bool RunningStatusLock) external onlyOwner
    {
        lockstatus = RunningStatusLock;
    }
}