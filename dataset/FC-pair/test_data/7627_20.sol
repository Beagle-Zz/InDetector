contract c7627{
    /**
        @notice Destroys a loan, the borrower could call this method if they performed an accidental or regretted 
        "approve" of the loan, this method only works for them if the loan is in "pending" status.
        The lender can call this method at any moment, in case of a loan with status "lent" the lender is pardoning 
        the debt. 
        @param index Index of the loan
        @return true if the destroy was done successfully
    */
    function destroy(uint index) public returns (bool) {
        Loan storage loan = loans[index];
        require(loan.status != Status.destroyed);
        require(msg.sender == loan.lender || (msg.sender == loan.borrower && loan.status == Status.initial));
        DestroyedBy(index, msg.sender);
        // ERC721, remove loan from circulation
        if (loan.status != Status.initial) {
            lendersBalance[loan.lender] -= 1;
            activeLoans -= 1;
            Transfer(loan.lender, 0x0, index);
        }
        loan.status = Status.destroyed;
        return true;
    }
}