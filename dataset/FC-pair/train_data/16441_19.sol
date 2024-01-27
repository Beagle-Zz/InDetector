contract c16441{
    // @return true if the transaction can buy tokens
    modifier saleIsOn() {
        bool withinPeriod = now >= startTime && now <= endTime;
        require(withinPeriod);
        _;
    }
}