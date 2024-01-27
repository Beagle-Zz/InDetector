contract c2736{
    /// @dev Callback that gets called when entering the SALE_ENDED state.
    function onSaleEnded() internal {
        trustedToken.transferOwnership(owner); 
        if (totalContributedUnits == 0) {
            // If no tokens were sold, transfer them back to the project team
            trustedToken.safeTransfer(trustedVault.trustedWallet(), tokensForSale);
        } else if (totalContributedUnits < minThresholdUnits) {
            // If the minimum threshold wasn't reached, enable refunds
            trustedVault.enableRefunds();
        } else {
            // Calculate the rate for the extra tokens (if the sale was sold out, it will be 0)
            extraTokensPerUnit = tokensForSale.div(totalContributedUnits).sub(saleTokensPerUnit);
            // Close the vault and transfer ownership to the owner of the sale
            trustedVault.close();
            trustedVault.transferOwnership(owner);
        }
    }
}