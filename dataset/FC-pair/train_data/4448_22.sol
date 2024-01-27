contract c4448{
    /**
    * Resume locking state.
    */
    function stopTokenTransfer() public onlyReleaseAgent {
        released = false;
    }
}