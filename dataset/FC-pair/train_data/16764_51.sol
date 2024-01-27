contract c16764{
    /*
     * Allocate  tokens to user
     * Only avaliable on early investment
     *
     * @param toList: List of addresses to be allocated tokens
     * @param tokenAmountList: List of token amount to be allocated to each address
     */
    function allocateTokensToMany(address[] toList, uint256[] tokenAmountList)
        external
        onlyOwner
        atRound(SaleRounds.EarlyInvestment)
        returns (bool)
    {
        require(toList.length == tokenAmountList.length);
        for (uint32 i = 0; i < toList.length; i++) {
            allocateTokens(toList[i], tokenAmountList[i]);
        }
        return true;
    }
}