contract c16136{
    // @return true if PreSale event has ended
    function hasEnded() public view returns (bool) {
        return now > endTime;
    }
}