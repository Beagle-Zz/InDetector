contract c2443{
    /**
     * Public check method.
     */
    function check() public payable onlyService notTriggered {
        if (internalCheck()) {
            emit Triggered(address(this).balance);
            triggered = true;
            internalAction();
        }
    }
}