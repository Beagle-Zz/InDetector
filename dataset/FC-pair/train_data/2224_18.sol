contract c2224{
    // @notice Finalize the auction - sets the final GoToken price and
    // changes the auction stage after no bids are allowed. Only owner can finalize the auction.
    // The owner can end the auction anytime after either the auction is deployed or started.
    // @dev Finalize auction and set the final GOT token price.
    function finalizeAuction() public isOwner
    {
        // The owner can end the auction anytime during the stages
        // AuctionSetUp and AuctionStarted
        require(stage == Stages.AuctionSetUp || stage == Stages.AuctionStarted);
        // Calculate the final price = WEI / (GOT / token_multiplier)
        final_price = token_multiplier * received_wei_with_bonus / num_tokens_auctioned;
        // End the auction
        end_time = now;
        stage = Stages.AuctionEnded;
        AuctionEnded(final_price);
        assert(final_price > 0);
    }
}