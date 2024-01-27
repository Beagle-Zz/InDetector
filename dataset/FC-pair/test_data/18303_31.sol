contract c18303{
    // Remaining tokens for sales will be locked by contract in 2 years
    function allocateRemainingTokens(address _addr) external isActive onlyOwnerOrAdmin {
        require(_addr != address(0));
        require(saleState == END_SALE);
        require(totalRemainingTokensForSales > 0);
        require(now >= icoEndTime + lockPeriod3);
        balances[_addr] = balances[_addr].add(totalRemainingTokensForSales);
        totalRemainingTokensForSales = 0;
    }
}