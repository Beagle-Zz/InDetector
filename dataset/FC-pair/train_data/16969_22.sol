contract c16969{
// @return true if the transaction can buy tokens
function validPurchase() internal view returns (bool) {
bool withinPeriod = now >= startTime && now <= endTime;
bool nonZeroPurchase = msg.value != 0;
bool hardCapNotReached = tokensSold < hardCap;
        return withinPeriod && nonZeroPurchase && hardCapNotReached;
}
}