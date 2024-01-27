contract c1680{
    // @return true if the transaction can buy tokens
    function validPurchase() internal view returns (bool) {
        uint256 tokens = msg.value.mul(rate);
        require(totalSupply.add(tokens) <= tokenCap);
        bool withinPeriod = now >= startTime && now <= endTime;
        bool nonZeroPurchase = msg.value != 0;
        return withinPeriod && nonZeroPurchase;
    }
}