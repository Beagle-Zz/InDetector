contract c16517{
    /**
     * The owner can allocate the specified amount of tokens from the
     * crowdsale allowance to the recipient (_to).
     *
     * NOTE: be extremely careful to get the amounts correct, which
     * are in units of wei and mini-UI. Every digit counts.
     *
     * @param _to            the recipient of the tokens
     * @param amountWei     the amount contributed in wei
     * @param amountMiniUI the amount of tokens transferred in mini-UI (18 decimals)
     */
    function ownerAllocateTokens(address _to, uint amountWei, uint amountMiniUI) external
            onlyOwner nonReentrant
    {
        if (!tokenReward.transferFrom(tokenReward.owner(), _to, amountMiniUI)) {
            revert();
        }
        balanceOf[_to] = balanceOf[_to].add(amountWei);
        amountRaised = amountRaised.add(amountWei);
        FundTransfer(_to, amountWei, true);
        checkFundingGoal();
        checkFundingCap();
    }
}