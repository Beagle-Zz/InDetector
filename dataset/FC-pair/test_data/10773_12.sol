contract c10773{
    /* Issue loan if LTD stays within range allowed by LTD params
        NB: it does not know about min loan amount, it's the loan contract's responsibility to enforce it */
    function issueLoan(address borrower, uint loanAmount) external {
         // only whitelisted LoanManager contracts
        require(permissions[msg.sender]["LoanManager"],
            "msg.sender must have LoanManager permission");
        require(loanAmount <= getMaxLoanAmountAllowedByLtd(), "loanAmount must be <= maxLoanAmountAllowedByLtd");
        totalLoanAmount = totalLoanAmount.add(loanAmount);
        augmintToken.issueTo(borrower, loanAmount);
    }
}