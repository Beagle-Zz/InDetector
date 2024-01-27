contract c10958{
    // @return true if the transaction can buy tokens
    function validPurchase() internal constant returns (bool) {
        bool nonZeroPurchase = msg.value != 0;
        bool minAmount = msg.value >= minimumParticipationAmount;
        bool withinCap = weiRaised.add(msg.value) <= cap;
        return nonZeroPurchase && minAmount && !isFinalized && withinCap;
    }
}