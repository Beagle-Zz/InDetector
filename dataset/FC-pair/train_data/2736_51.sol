contract c2736{
    /// @dev Returns true if the cap was reached.
    function wasCapReached(bytes32) internal returns (bool) {
        return totalSaleCapUnits <= totalContributedUnits;
    }
}