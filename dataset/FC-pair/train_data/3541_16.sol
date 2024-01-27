contract c3541{
    // EXTERNAL : PARTICIPATION
    /// @notice Give melon tokens to receive shares of this fund
    /// @dev Recommended to give some leeway in prices to account for possibly slightly changing prices
    /// @param giveQuantity Quantity of Melon token times 10 ** 18 offered to receive shareQuantity
    /// @param shareQuantity Quantity of shares times 10 ** 18 requested to be received
    /// @param investmentAsset Address of asset to invest in
    function requestInvestment(
        uint giveQuantity,
        uint shareQuantity,
        address investmentAsset
    )
        external
        pre_cond(!isShutDown)
        pre_cond(isInvestAllowed[investmentAsset]) // investment using investmentAsset has not been deactivated by the Manager
        pre_cond(modules.compliance.isInvestmentPermitted(msg.sender, giveQuantity, shareQuantity))    // Compliance Module: Investment permitted
    {
        requests.push(Request({
            participant: msg.sender,
            status: RequestStatus.active,
            requestAsset: investmentAsset,
            shareQuantity: shareQuantity,
            giveQuantity: giveQuantity,
            receiveQuantity: shareQuantity,
            timestamp: now,
            atUpdateId: modules.pricefeed.getLastUpdateId()
        }));
        emit RequestUpdated(getLastRequestId());
    }
}