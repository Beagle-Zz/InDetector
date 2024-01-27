contract c2874{
    /// @notice start time of the ICO
    function getStartTime() public view returns (uint) {
        return c_priceChangeDates[0];
    }
}