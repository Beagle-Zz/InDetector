contract c12968{
    /**
     * @dev Withdraws fees to the caller
     */
    function withdrawFees()
        external
        whenSystemNotPaused
        currentRoundInitialized
        autoClaimEarnings
    {
        // Delegator must have fees
        require(delegators[msg.sender].fees > 0);
        uint256 amount = delegators[msg.sender].fees;
        delegators[msg.sender].fees = 0;
        // Tell Minter to transfer fees (ETH) to the delegator
        minter().trustedWithdrawETH(msg.sender, amount);
        WithdrawFees(msg.sender);
    }
}