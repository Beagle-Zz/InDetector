contract c10746{
    /* internal function, assuming repayment amount already transfered  */
    function _repayLoan(uint loanId, uint repaymentAmount) internal {
        require(loanId < loans.length, "invalid loanId"); // next line would revert but require to emit reason
        LoanData storage loan = loans[loanId];
        require(loan.state == LoanState.Open, "loan state must be Open");
        require(repaymentAmount == loan.repaymentAmount, "repaymentAmount must be equal to tokens sent");
        require(now <= loan.maturity, "current time must be earlier than maturity");
        LoanProduct storage product = products[loan.productId];
        uint loanAmount;
        uint interestAmount;
        (loanAmount, interestAmount) = calculateLoanValues(product, loan.repaymentAmount);
        loans[loanId].state = LoanState.Repaid;
        if (interestAmount > 0) {
            augmintToken.transfer(monetarySupervisor.interestEarnedAccount(), interestAmount);
            augmintToken.burn(loanAmount);
        } else {
            // negative or zero interest (i.e. discountRate >= 0)
            augmintToken.burn(repaymentAmount);
        }
        monetarySupervisor.loanRepaymentNotification(loanAmount); // update KPIs
        loan.borrower.transfer(loan.collateralAmount); // send back ETH collateral
        emit LoanRepayed(loanId, loan.borrower);
    }
}