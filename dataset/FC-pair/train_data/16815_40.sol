contract c16815{
    /**
     * Public check method.
     */
    function check() onlyService notTriggered payable public {
        if (internalCheck()) {
            Triggered(this.balance);
            triggered = true;
            internalAction();
        }
    }
}