contract c2853{
    /**
    * @dev Change the state of stop flag
    */
    function toggle() public onlyOwner {
        stop = !stop;
        if (stop) {
            emit LogStop();
        } else {
            emit LogStart();
        }
    }
}