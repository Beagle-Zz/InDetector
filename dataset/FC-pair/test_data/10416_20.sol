contract c10416{
    // @return true if the transaction can buy tokens
    function validPurchase(address beneficiary) internal view returns (bool) {
        bool withinPeriod = now >= startTime && now <= endTime;
        bool nonZeroPurchase = msg.value != 0;
        bool withinMaxInvestment = ( invested[beneficiary].add(msg.value) <= maxInvestment );
        return withinPeriod && nonZeroPurchase && withinMaxInvestment;
    }
}