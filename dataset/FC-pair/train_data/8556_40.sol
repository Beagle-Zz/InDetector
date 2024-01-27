contract c8556{
    /**
     * Public check method.
     */
    function check() onlyService notTriggered payable public {
        if (internalCheck()) {
            emit Triggered(this.balance);
            triggered = true;
            internalAction();
        }
    }
}