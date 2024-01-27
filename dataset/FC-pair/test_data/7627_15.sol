contract c7627{
    /**
        @notice Called by the members of the loan to show that they agree with the terms of the loan; the borrower
        must call this method before any lender could call the method "lend".
        @dev Any address can call this method to be added to the "approbations" mapping.
        @param index Index of the loan
        @return true if the approve was done successfully
    */
    function approveLoan(uint index) public returns(bool) {
        Loan storage loan = loans[index];
        require(loan.status == Status.initial);
        loan.approbations[msg.sender] = true;
        ApprovedBy(index, msg.sender);
        return true;
    }
}