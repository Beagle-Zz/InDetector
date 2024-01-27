contract c16444{
    // @return true if CrowdSale event has ended
    function hasEnded() public view returns (bool) {
        return now > endRefundableTime;
    }
}