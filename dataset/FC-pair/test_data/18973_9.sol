contract c18973{
    /*----------  ADMINISTRATOR ONLY FUNCTIONS  ----------*/
    /**
     * In case one of us dies, we need to replace ourselves.
     */
    // no you memers OnlyOpen also checks if admin calls it
    function OpenContract() public OnlyOpen() {
        IsOpen=true;
    }
}