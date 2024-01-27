contract c23{
    /*
     * Allocate  tokens to user
     * Only avaliable on early investment
     *
     * @param to: Address of user to be allocated tokens
     * @param tokenAmount: Amount of tokens to be allocated
     */
    function allocateTokens(address to, uint256 tokenAmount)
        public
        onlyOwner
        atRound(SaleRounds.EarlyInvestment)
        returns (bool)
    {
        require(allocationList[to].isAllowed
            && tokenAmount <= allocationList[to].allowedAmount);
        if (!token.transferFrom(token.owner(), to, tokenAmount)) {
            revert();
        }
        return true;
    }
}