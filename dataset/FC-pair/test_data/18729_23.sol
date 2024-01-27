contract c18729{
    // return true if the transaction can buy tokens
    function validPurchase(uint weiAmount) internal constant returns (bool) {
        bool withinPeriod = now >= startTime && now <= endTime;
        bool withinCap = weiRaised.add(weiAmount) <= weiMaximumGoal;
        return withinPeriod && withinCap;
    }
}