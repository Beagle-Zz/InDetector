contract c4826{
    /**
    * End locking state
    */
    function releaseTokenTransfer() public onlyReleaseAgent {
        released = true;
    }
}