contract c7627{
    /**
        @notice Withdraw lender funds in batch, it walks by all the loans passed to the function and withdraws all
        the funds stored on that loans.
        @dev This batch withdraw method can be expensive in gas, it must be used with care.
        @param loanIds Array of the loans to withdraw
        @param to Destination of the tokens
        @return the total withdrawed 
    */
    function withdrawalList(uint256[] memory loanIds, address to) public returns (uint256) {
        uint256 inputId;
        uint256 totalWithdraw = 0;
        for (inputId = 0; inputId < loanIds.length; inputId++) {
            Loan storage loan = loans[loanIds[inputId]];
            if (loan.lender == msg.sender) {
                totalWithdraw += loan.lenderBalance;
                loan.lenderBalance = 0;
            }
        }
        require(rcn.transfer(to, totalWithdraw));
        unlockTokens(rcn, totalWithdraw);
        return totalWithdraw;
    }
}