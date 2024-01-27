contract c2224{
    // @notice Distribute GoTokens for "receiver_address" after the auction has ended by the owner.
    // @dev Distribute GoTokens for "receiver_address" after auction has ended by the owner.
    // @param receiver_address GoTokens will be assigned to this address if eligible.
    function distributeGoTokens(address receiver_address)
        public isDistributor atStage(Stages.AuctionEnded) returns (bool)
    {
        // Waiting period in days after the end of the auction, before anyone can claim GoTokens.
        // Ensures enough time to check if auction was finalized correctly
        // before users start transacting tokens
        require(now > end_time + TOKEN_CLAIM_WAIT_PERIOD);
        require(receiver_address != 0x0);
        require(bids[receiver_address].received > 0);
        if (bids[receiver_address].received == 0 || bids[receiver_address].accounted == 0) {
            return false;
        }
        // Number of GOT = bid_wei_with_bonus / (wei_per_GOT * token_multiplier)
        // Includes the bonus
        uint256 num = (token_multiplier * bids[receiver_address].accounted) / final_price;
        // Due to final_price rounding, the number of assigned tokens may be higher
        // than expected. Therefore, the number of remaining unassigned auction tokens
        // may be smaller than the number of tokens needed for the last claimTokens call
        uint256 auction_tokens_balance = token.balanceOf(address(this));
        if (num > auction_tokens_balance) {
            num = auction_tokens_balance;
        }
        // Update the total amount of funds for which tokens have been claimed
        funds_claimed += bids[receiver_address].received;
        // Set receiver bid to 0 before assigning tokens
        bids[receiver_address].accounted = 0;
        bids[receiver_address].received = 0;
        // Send the GoTokens to the receiver address including the qualified bonus
        require(token.transfer(receiver_address, num));
        // Log the event for claimed GoTokens
        ClaimedTokens(receiver_address, num);
        // After the last tokens are claimed, change the auction stage
        // Due to the above logic described, rounding errors will not be an issue here.
        if (funds_claimed == received_wei) {
            stage = Stages.TokensDistributed;
            TokensDistributed();
        }
        assert(token.balanceOf(receiver_address) >= num);
        assert(bids[receiver_address].accounted == 0);
        assert(bids[receiver_address].received == 0);
        return true;
    }
}