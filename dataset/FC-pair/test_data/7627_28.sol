contract c7627{
    /**
        @notice Returns the pending amount up to the last time of the interest update. This is not the real pending amount
        @dev This method is exact only if "addInterest(loan)" was before and in the same block.
        @param index Index of the loan
        @return The past pending amount
    */
    function getRawPendingAmount(uint index) public view returns (uint256) {
        Loan memory loan = loans[index];
        return safeSubtract(safeAdd(safeAdd(loan.amount, loan.interest), loan.punitoryInterest), loan.paid);
    }
}