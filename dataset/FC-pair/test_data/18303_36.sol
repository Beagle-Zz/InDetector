contract c18303{
    // Get softcap reaching status
    function isSoftCapReached() public view returns (bool) {
        return totalInvestedAmount >= minInvestedCap;
    }
}