contract c18923{
    // @return true if the transaction can buy tokens
    function validPurchase() internal view returns (bool) {
        bool withinPeriod = getNow() >= START_TIME && getNow() <= icoEndTime;
        bool nonZeroPurchase = msg.value != 0;
        bool canMint = token.totalSupply() < ICO_TOKENS;
        bool validStage = (currentStage < stages.length);
        return withinPeriod && nonZeroPurchase && canMint && validStage;
    }
}