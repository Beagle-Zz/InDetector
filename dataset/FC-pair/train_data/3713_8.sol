contract c3713{
    // For wallet Founding Investor and Initiator Team
    function getWithdrawableAmountFIIT(address _investor) public view returns(uint256) {
        require(startWithdraw != 0);
        // interval in months
        uint interval = safeDiv(safeSub(now,startWithdraw),30 days);
        // total allocatedTokens
        uint _allocatedTokens = safeAdd(walletFoundingInitiatorSales[_investor],releasedFoundingInitiatorSales[_investor]);
        // Atleast 24 months
        if (interval < 24) { 
            return (0); 
        } else if (interval >= 24) {
            return safeSub(_allocatedTokens, releasedFoundingInitiatorSales[_investor]);
        }
    }
}