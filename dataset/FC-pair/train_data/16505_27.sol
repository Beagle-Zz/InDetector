contract c16505{
    // @return true if the transaction can buy tokens
    modifier saleIsOn() {
        bool withinPeriod = now >= startTime && now <= endCrowdSaleTime;
        require(withinPeriod);
        _;
    }
}