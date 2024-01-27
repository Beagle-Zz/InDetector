contract c3713{
    // For wallet Angel Sales and PE Sales
    function getWithdrawableAmountANPES(address _investor) public view returns(uint256) {
        require(startWithdraw != 0);
        // interval in months
        uint interval = safeDiv(safeSub(now,startWithdraw),30 days);
        // total allocatedTokens
        uint _allocatedTokens = safeAdd(walletAngelPESales[_investor],releasedAngelPESales[_investor]);
        // Atleast 6 months
        if (interval < 6) { 
            return (0); 
        } else if (interval >= 6 && interval < 12) {
            return safeSub(getPercentageAmount(25,_allocatedTokens), releasedAngelPESales[_investor]);
        } else if (interval >= 12 && interval < 18) {
            return safeSub(getPercentageAmount(50,_allocatedTokens), releasedAngelPESales[_investor]);
        } else if (interval >= 18 && interval < 24) {
            return safeSub(getPercentageAmount(75,_allocatedTokens), releasedAngelPESales[_investor]);
        } else if (interval >= 24) {
            return safeSub(_allocatedTokens, releasedAngelPESales[_investor]);
        }
    }
}