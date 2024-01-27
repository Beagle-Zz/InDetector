contract c3419{
    /// @return Get time to end of the competition
    function getTimeTillEnd() view returns (uint) {
        if (now > endTime) {
            return 0;
        }
        return sub(endTime, now);
    }
}