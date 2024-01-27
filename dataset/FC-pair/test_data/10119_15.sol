contract c10119{
    /** 
     * During public sale it is possinble to withdraw at any time.
     */
    function canWithdraw() public view returns (bool) {
        return true;
    }
}