contract c4448{
    /**
    * End locking state
    */
    function releaseTokenTransfer() public onlyReleaseAgent {
        released = true;
    }
}