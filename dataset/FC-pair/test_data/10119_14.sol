contract c10119{
    /** 
     * It will be possible to refund only if min (soft) cap is not reached and 
     * refund requested during 3 months after presale finished.
     */
    function canRefund() public view returns (bool) {
        return totalWeiReceived < minCapWei && endTime < now && now <= refundDeadlineTime;
    }
}