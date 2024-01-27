contract c1384{
    /*
        This function is used for taxation purposes and will be used after pre-defined requirement are met
    */
    function taxTransfer(address from, address to, uint tokensAmount) external onlyCurrentHookOperator nonZeroAddress(from) nonZeroAddress(to) returns(bool) {  
        require(balances[from] >= tokensAmount);
        transferDirectly(from, to, tokensAmount);
        hookOperator.onTaxTransfer(from, tokensAmount);
        emit LogTaxTransfer(from, to, tokensAmount);
        return true;
    }
}