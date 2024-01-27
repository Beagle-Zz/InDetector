contract c18760{
    // @return true if the transaction can buy tokens from ICO
    function validPurchaseIco(uint256 _amount) public constant returns (bool) {
        bool withinPeriod = now >= startTimeIco && now <= endTimeIco;
        bool nonZeroPurchase = _amount != 0;
        return withinPeriod && nonZeroPurchase;
    }
}