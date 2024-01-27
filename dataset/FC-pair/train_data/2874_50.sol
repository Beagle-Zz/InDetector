contract c2874{
    /// @notice finish time of the ICO
    function getFinishTime() public view returns (uint) {
        return c_priceChangeDates[c_priceChangeDates.length - 1];
    }
}