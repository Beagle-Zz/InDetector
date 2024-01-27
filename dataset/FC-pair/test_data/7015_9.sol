contract c7015{
    /**
     @dev Withdraw accumulated fees, without disturbing the core reserve
     */
    function extractFees(uint amountInWei) onlyAdmin public {
        require (amountInWei <= collectedFees);
        msg.sender.transfer(amountInWei);
    }
}