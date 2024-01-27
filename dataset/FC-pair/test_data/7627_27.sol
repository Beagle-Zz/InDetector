contract c7627{
    /**
        @notice Returns the pending amount to complete de payment of the loan, keep in mind that this number increases 
        every second.
        @dev This method also computes the interest and updates the loan
        @param index Index of the loan
        @return Aprox pending payment amount
    */
    function getPendingAmount(uint index) public returns (uint256) {
        addInterest(index);
        return getRawPendingAmount(index);
    }
}