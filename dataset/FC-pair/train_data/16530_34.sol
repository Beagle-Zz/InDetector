contract c16530{
    /** 
     * During tokensale it will be possible to withdraw only in two cases:
     * min cap reached OR refund period expired.
     */
    function canWithdraw() public view returns (bool) {
        return totalWeiReceived >= minCapWei || now > refundDeadlineTime;
    }
}