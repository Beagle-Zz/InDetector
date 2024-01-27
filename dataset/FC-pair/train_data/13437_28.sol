contract c13437{
    // @return true if CrowdSale event has ended
    function hasEnded() public view returns (bool) {
        return now > endRefundableTime;
    }
}