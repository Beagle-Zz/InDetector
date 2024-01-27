contract c16528{
    /** 
     * It will be possible to refund only if min (soft) cap is not reached and 
     * refund requested during 30 days after tokensale finished.
     */
    function canRefund() public view returns (bool) {
        return totalWeiReceived < minCapWei && endTime < now && now <= refundDeadlineTime;
    }
}