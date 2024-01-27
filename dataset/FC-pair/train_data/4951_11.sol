contract c4951{
    /**
     * @dev checks whether the fundraiser passed `endtime`.
     *
     * @return whether the fundraiser is passed its deadline or not.
     */
    function hasEnded() public view returns (bool) {
        return now >= endTime;
    }
}