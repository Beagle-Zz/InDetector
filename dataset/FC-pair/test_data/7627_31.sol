contract c7627{
    /**
        @notice Updates the loan accumulated interests up to the current Unix time.
        @param index Index of the loan
        @return true If the interest was updated
    */
    function addInterest(uint index) public returns (bool) {
        Loan storage loan = loans[index];
        require(loan.status == Status.lent);
        internalAddInterest(loan, block.timestamp);
    }
}