contract c10774{
    /* repay loan, called from AugmintToken's transferAndNotify
     Flow for repaying loan:
        1) user calls token contract's transferAndNotify loanId passed in data arg
        2) transferAndNotify transfers tokens to the Lender contract
        3) transferAndNotify calls Lender.transferNotification with lockProductId
    */
    // from arg is not used as we allow anyone to repay a loan:
    function transferNotification(address, uint repaymentAmount, uint loanId) external {
        require(msg.sender == address(augmintToken), "msg.sender must be augmintToken");
        _repayLoan(loanId, repaymentAmount);
    }
}