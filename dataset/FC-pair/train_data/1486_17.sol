contract c1486{
    /**
     * @dev Distribute fee between investors
     */
    function distributeInvestorsFee(uint start, uint end) onlyOwner public {
        for (uint i = start; i < end; i++) {
            address investor = investors.investors(i);
            uint investorPercentage = investors.investorPercentages(investor);
            data.addInvestorBalance(investor, investorsBalance * investorPercentage);
        }
        if (end == investors.getInvestorsCount()) {
            investorsBalance = 0;
        }
    }
}