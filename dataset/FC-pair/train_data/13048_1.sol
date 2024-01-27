contract c13048{
    // Main function to pay interests
    function payInterests() isUnlocked public {
        if (fortnightsFromLast() == 0) { // Check for a fortnight passed
            emit Message("0 fortnights passed");
            return;
        }
        uint amountToPay = calculateInterest(msg.sender);
        if (amountToPay == 0) {
            emit Message("There are not 150 tokens with interests to pay");
            return;
            }
        // Success
        lastFortnightPayed[msg.sender] = now;
        require(token.transferFrom(tokenSpender,msg.sender,amountToPay));
    }
}