contract c7627{
    /**
        @notice Used to know if a loan is ready to lend
        @param index Index of the loan
        @return true if the loan has been approved by the borrower and cosigner.
    */
    function isApproved(uint index) public view returns (bool) {
        Loan storage loan = loans[index];
        return loan.approbations[loan.borrower];
    }
}