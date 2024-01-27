contract c18718{
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