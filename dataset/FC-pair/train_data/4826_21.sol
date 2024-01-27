contract c4826{
    /**
    * Resume locking state.
    */
    function stopTokenTransfer() public onlyReleaseAgent {
        released = false;
    }
}