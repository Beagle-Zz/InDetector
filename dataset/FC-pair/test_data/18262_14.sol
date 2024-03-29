contract c18262{
    // Refund
    /**
     * @dev Called to start refunding
     */
    function enableRefund() internal {
        require(state == FundState.TeamWithdraw);
        state = FundState.Refund;
        token.destroy(companyTokenWallet, token.balanceOf(companyTokenWallet));
        token.destroy(reserveTokenWallet, token.balanceOf(reserveTokenWallet));
        token.destroy(foundationTokenWallet, token.balanceOf(foundationTokenWallet));
        token.destroy(bountyTokenWallet, token.balanceOf(bountyTokenWallet));
        token.destroy(referralTokenWallet, token.balanceOf(referralTokenWallet));
        token.destroy(advisorTokenWallet, token.balanceOf(advisorTokenWallet));
        RefundEnabled(msg.sender);
    }
}