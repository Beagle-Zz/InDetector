contract c2310{
    // Check for the possibility of buying tokens. Inside. Constant.
    function validPurchase() internal view returns (bool) {
        // The round started and did not end
        bool withinPeriod = (now > startTime && now < endTime.add(renewal));
        // Rate is greater than or equal to the minimum
        bool nonZeroPurchase = msg.value >= minPay;
        // hardCap is not reached, and in the event of a transaction, it will not be exceeded by more than OverLimit
        bool withinCap = msg.value <= hardCap.sub(weiRaised()).add(overLimit);
        // round is initialized and no "Pause of trading" is set
        return withinPeriod && nonZeroPurchase && withinCap && isInitialized && !isFinalized && !isPausedCrowdsale;
    }
}