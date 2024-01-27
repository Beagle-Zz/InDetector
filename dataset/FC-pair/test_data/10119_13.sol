contract c10119{
    /** 
     * During presale it will be possible to withdraw only in two cases:
     * min cap reached OR refund period expired.
     */
    function canWithdraw() public view returns (bool) {
        return totalWeiReceived >= minCapWei || now > refundDeadlineTime;
    }
}