contract c2224{
/*
---------------------------------------------------------------------------------------------
    Private function for calcuclating current token price
---------------------------------------------------------------------------------------------
*/
    // @dev Calculates the token price (WEI / GOT) at the current timestamp
    // during the auction; elapsed time = 0 before auction starts.
    // This is a composite exponentially decaying curve (two curves combined).
    // The curve 1 is for the first 8 days and the curve 2 is for the remaining days.
    // They are of the form:
    //         current_price  = price_start * (1 + elapsed) / (1 + elapsed + decay_rate);
    //          where, decay_rate = elapsed ** price_exponent / price_constant;
    // Based on the provided parameters, the price does not change in the first
    // price_constant^(1/price_exponent) seconds due to rounding.
    // Rounding in `decay_rate` also produces values that increase instead of decrease
    // in the beginning of the auction; these spikes decrease over time and are noticeable
    // only in first hours. This should be calculated before usage.
    // @return Returns the token price - WEI per GOT.
    function calcTokenPrice() constant private returns (uint256) {
        uint256 elapsed;
        uint256 decay_rate1;
        uint256 decay_rate2;
        if (stage == Stages.AuctionDeployed || stage == Stages.AuctionSetUp){
          return price_start;
        }
        if (stage == Stages.AuctionStarted) {
            elapsed = now - auction_start_time;
            // The first eight days auction price curve
            if (now >= auction_start_time && now < auction_start_time + CURVE_CUTOFF_DURATION){
              decay_rate1 = elapsed ** price_exponent1 / price_constant1;
              return price_start * (1 + elapsed) / (1 + elapsed + decay_rate1);
            }
            // The remaining days auction price curve
            else if (now >= auction_start_time && now >= auction_start_time + CURVE_CUTOFF_DURATION){
              decay_rate2 = elapsed ** price_exponent2 / price_constant2;
              return price_start * (1 + elapsed) / (1 + elapsed + decay_rate2);
            }
            else {
              return price_start;
            }
        }
    }
}