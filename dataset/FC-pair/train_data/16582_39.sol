contract c16582{
    /** 
     * During presale it is possible to withdraw at any time.
     */
    function canWithdraw() public view returns (bool) {
        return true;
    }
}