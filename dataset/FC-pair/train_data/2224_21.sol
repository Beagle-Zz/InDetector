contract c2224{
    /// @notice Get the remaining funds needed to end the auction, calculated at
    /// the current GOT price in WEI.
    /// @dev The remaining funds necessary to end the auction at the current GOT price in WEI.
    /// @return Returns the remaining funds to end the auction in WEI.
    function remainingFundsToEndAuction() constant public returns (uint256) {
        // num_tokens_auctioned = total number of indivisible GOT (GOT * token_multiplier) that is auctioned
        uint256 required_wei_at_price = num_tokens_auctioned * price() / token_multiplier;
        if (required_wei_at_price <= received_wei) {
            return 0;
        }
        return required_wei_at_price - received_wei;
    }
}