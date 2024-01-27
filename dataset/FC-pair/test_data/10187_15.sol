contract c10187{
    // overriding Crowdsale#validPurchase to add extra cap logic
    // @return true if investors can buy at the moment
    function validPurchase() internal view returns (bool) {
        if (msg.value < minWeiInvestment || msg.value > maxWeiInvestment) {
            return false;
        }
        bool withinPeriod = (now >= startTime) && (now <= endTime);  // 1128581 1129653
        return withinPeriod;
    }
}